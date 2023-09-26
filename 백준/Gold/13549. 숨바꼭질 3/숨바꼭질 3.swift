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

let nk = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}

let n = nk[0]
let k = nk[1]


var heap = Heap<Edge>(comparer: <=)

heap.push(Edge(start: n, cost: 0))
var ans:Int = 0

let MAX:Int = 100001

var dist:[Int] = [Int](repeating:Int.max,count:MAX)

while !heap.isEmpty {
    
    let top = heap.pop()!
    
    if top.start == k {
        ans = top.cost
        break
    }
    
    let right = top.start+1
    
    
    let left = top.start-1
    
    let warp = top.start * 2
    
    if right < MAX &&  dist[right] > top.cost + 1{
        dist[right] = top.cost + 1
        heap.push(Edge(start: right, cost: dist[right]))
    }
    
    if left >= 0 && dist[left] > top.cost + 1 {
        dist[left] = top.cost + 1
        heap.push(Edge(start: left, cost: dist[left]))
    }
    
    if warp < MAX && dist[warp] > top.cost{
        dist[warp] = top.cost // 순간이동은 그대로
        heap.push(Edge(start: warp, cost: dist[warp]))
    }
    
}


print(ans)
