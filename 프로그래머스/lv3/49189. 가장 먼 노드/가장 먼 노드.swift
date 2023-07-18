import Foundation

struct Deque<T> {
    
    private var enqueue:[T]
    private var dequeue:[T] = []
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    public var isEmpty : Bool {
        
        return enqueue.isEmpty && dequeue.isEmpty
        
    }
    
    public var count: Int {
        
        return enqueue.count + dequeue.count
    }
    
    public var first: T? {
        
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
        
    }
    
    mutating func pushLast(_ t:T) {
        enqueue.append(t)
    }
    
    mutating func pushFirst(_ t:T){
        dequeue.append(t)
    }
    
    mutating func popLast() -> T? {
        
        if enqueue.isEmpty {
            dequeue.reverse()
            let ret = dequeue.popLast()
            dequeue.reverse()
            
            return ret
        }
        
        return enqueue.popLast()
    }
    
    mutating func popFirst() ->T? {
        
        if dequeue.isEmpty {
            
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
    
    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
    
    
    
    
}


func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph:[[Int]] = Array(repeating:[],count:n+1)
    
    var dist = Array(repeating:Int.max,count:n+1)
    var visited = Array(repeating:false,count:n+1)
    
    
    for e in edge {
        graph[e[0]].append(e[1])
        graph[e[1]].append(e[0])
    }
    
    var stk:[Int] = []

    dist[1] = 0
    stk.append(1)
    
    var deque = Deque<Int>([])
    
    deque.pushLast(1)
    
    while !deque.isEmpty {
        
        let now:Int = deque.popFirst()!
        
        
        
        for nxt in graph[now] {
            
            if dist[nxt] > dist[now] + 1 {
                dist[nxt] = dist[now] + 1
                deque.pushLast(nxt)
            }
            
        }
    }
    
    let m = dist[1...].max()!
    
    
    return dist[1...].filter{$0 == m}.count
}