import Foundation

struct Queue<T> {
    
    var enque: [T]
    var deque: [T] = []
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty 
    }
    
    
    init(_ enque:[T]) {
        self.enque = enque
    }
    
    mutating func push(_ element: T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.removeLast()
    }
    
}


func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph: [[Int]] = Array(repeating: [], count:n+1)
    
    var dist: [Int] = [Int](repeating:Int.max, count: n+1)
    
    for edg in edge {
        
        let e: Int = edg[0]
        let v: Int = edg[1]
        
        graph[e].append(v)
        graph[v].append(e)
        
    }
    
    var q = Queue<Int>([])
    
    q.push(1)
    dist[1] = 0
    dist[0] = 0
    

    
    while !q.isEmpty {
        
        let front = q.pop()!
 
        
        for next in graph[front] {
            
            if dist[front] + 1 < dist[next] {
                
                dist[next] = dist[front] + 1
                q.push(next)
            }
            
        }
    }
    
    let `max` = dist.max()!
    
    
    return dist.filter{$0 == max}.count
}