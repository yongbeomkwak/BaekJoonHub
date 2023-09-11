import Foundation

struct Deque<T: Equatable> {
    private var enqueue: [T]
    private var dequeue: [T] = []
    
    public var count: Int {
        return enqueue.count + dequeue.count
    }
    public var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    public var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    mutating func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    mutating func pushLast(_ n: T) {
        enqueue.append(n)
    }
    mutating func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
        
    }
    mutating func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    mutating func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)
    }
    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}


func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var q1 = Deque(queue1)
    var q2 = Deque(queue2)
    var sum1:Int = queue1.reduce(0,+)
    var sum2:Int = queue2.reduce(0,+)
    let target = (sum1 + sum2 ) / 2
    
    if (sum1 + sum2 ) % 2 != 0 {
        return -1 
    }
    
    
    for i in 0..<queue1.count * 3 {
        
        if sum1 == sum2 {
            return i 
        }
        
        
        if sum1 > sum2 {
            
            let p:Int = q1.popFirst()!
            q2.pushLast(p)
            sum1 -= p
            sum2 += p

        }
        
        else  {
            let p:Int = q2.popFirst()!
            q1.pushLast(p)
            sum1 += p
            sum2 -= p
        }
        
        
    }
    
    
    
    
    
    return -1
}