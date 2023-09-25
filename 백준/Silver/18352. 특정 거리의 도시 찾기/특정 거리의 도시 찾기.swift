struct Edge{
    let start:Int
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

let nmkx = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}

let n = nmkx[0]
let m = nmkx[1]
let k = nmkx[2]
let x = nmkx[3]

var adj:[[Edge]] = [[Edge]](repeating:[],count:n+1)
var dist:[Int] = [Int](repeating:Int.max,count: n+1)

var heap = Heap<Edge>(comparer: <=)

for i in 0..<m {
    let edge = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    adj[edge[0]].append(Edge(start: edge[1], cost: 1))
}


var ans:[Int] = []


heap.push(Edge(start: x, cost: 0))
dist[x] = 0

while !heap.isEmpty {
    
    let top = heap.pop()!
    
    if top.cost == k {
        ans.append(top.start)
    }
    
    
    for nxt in adj[top.start] {
        
        if dist[nxt.start] > top.cost + 1 {
            dist[nxt.start] =  top.cost + 1
            heap.push(Edge(start: nxt.start, cost: dist[nxt.start]))
        }
        
    }
    
    
}

if ans.isEmpty{
    print(-1)
}

else {
    for i in ans.sorted(){
        print(i)
    }
}


