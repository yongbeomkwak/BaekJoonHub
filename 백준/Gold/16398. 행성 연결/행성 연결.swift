struct Edge{
    let start:Int
    let end:Int
    let cost:Int
    
  
    public static func <=(lhs:Self,rhs:Self) -> Bool {
        return rhs.cost <= lhs.cost
    }
}


struct Heap<T>{
    
    var nodes:[T] = []
    var comparer:(T,T) -> Bool
    
    var isEmpty:Bool {
        return nodes.isEmpty
    }
    
    var top:T? {
        return nodes.first
    }
    
    var count:Int {
        return nodes.count
    }
    
    init(comparer: @escaping (T,T) -> Bool ){
        self.comparer = comparer
    }
    
    
    mutating func push(_ element:T){
        
        nodes.append(element)
        
        var index:Int = nodes.count-1
        
        
        while index > 0 && !comparer(nodes[index],nodes[(index-1)/2]) {
            
            let parent = (index-1)/2
            nodes.swapAt(index, parent)
            index = parent
            
        
        }
        
    }
    
    mutating func pop() ->T? {
        
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.popLast()
        }
        
        
        nodes.swapAt(0, nodes.count - 1)
        
        let result = nodes.popLast()
        
        var index:Int = 0
        
        
        while index < nodes.count {
            
            let left:Int = index * 2+1
            let right:Int = left+1
            
            
            if right < nodes.count {
                
                if comparer(nodes[left],nodes[right]) && !comparer(nodes[right],nodes[index]) {
                    
                    nodes.swapAt(right, index)
                    index = right
                    
                }
                
                else if !comparer(nodes[left],nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                }
                
                else {
                    break
                }
                
            }
            
            else if left < nodes.count {
                if !comparer(nodes[left],nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else {
                break
            }
            
        }
        
        
        return result
    }
    
    
}

let n = Int(readLine()!)!


var adj:[[Edge]] = [[Edge]](repeating:[],count:n+1)
var visited:[Bool] = [Bool](repeating:false,count: n+1)

var heap = Heap<Edge>(comparer: <=)

for i in 0..<n {
    let edge = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    for j in 0..<n {
        adj[i].append(Edge(start: i, end: j, cost: edge[j]))
    }
}


var ans:Int = 0

heap.push(Edge(start: 0, end: 1, cost: 0))

while !heap.isEmpty {
    
    
    let top = heap.pop()!
    if visited[top.end] {
        continue
    }
    
    visited[top.end] = true
    ans += top.cost
    
    for nxt in adj[top.end] {
        
        if visited[nxt.end] {
            continue
        }
        
        heap.push(nxt)
    }
    
    
    
}

print(ans)
