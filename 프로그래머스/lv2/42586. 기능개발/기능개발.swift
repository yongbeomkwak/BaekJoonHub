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


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
  
    
    
    var ans:[Int] = .init()
    
    var days:[Int] = .init()
    
    for (i,prog) in progresses.enumerated(){
        
        days.append((100 - prog - 1) / speeds[i] + 1 ) 
        // (100 - 진행 - 1) / 속도  + 1  , 올림 효과
    
    }
    
    var deque = Deque(days)
    
    
    
    while !deque.isEmpty{
       
        let front = deque.popFirst()!
        var cnt:Int = 1 
        
        while !deque.isEmpty && deque.first! <= front {
            cnt += 1
            deque.popFirst()!
        } 
        
        ans.append(cnt)
        
        
    }


    
    
      
    
    return ans
}