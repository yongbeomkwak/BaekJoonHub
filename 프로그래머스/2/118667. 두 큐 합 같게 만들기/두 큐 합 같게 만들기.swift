import Foundation

struct Queue<T> {
    
    var enque:[T]
    var deque:[T] = []
    
    public init(_ enque:[T]) {
        self.enque = enque
    }
    
    var first: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return deque.last
        
    }
    
    mutating func push(_ element:T) {
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



func solution(_ queue1:[Int], _ queue2:[Int]) -> Int{
    
    let limit = queue1.count * 3 
    var ans:Int = 0
    
    var q1 = queue1.reduce(0,+)
    var q2 = queue2.reduce(0,+)
    
    if (q1+q2) % 2 != 0 {
        return -1 
    }

    var queue1 = Queue(queue1)
    var queue2 = Queue(queue2)
    
    while (ans < limit) {
        
        if q1 ==  q2 {
            
            return ans
            
        } else if q1 > q2  {
            let pop = queue1.pop()!
            q1 -= pop
            q2 += pop
            queue2.push(pop)
        } else {
            let pop = queue2.pop()!
            q2 -= pop
            q1 += pop
            queue1.push(pop)
        }
        
        ans += 1   
    }
    
    
    return -1
}