import Foundation


struct Deque<T> {
    private var enqueue:[T]
    private var dequeue:[T] = []
    
    init(_ input:[T]){
        self.enqueue = input
    }
    
    public var first :T? {
        
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
        
    }
    
     public var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
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
    
    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }

    
}



func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var withIndex:[(Int,Int)] = .init()
    
    var remainTask:[Int] = Array(repeating:0,count:10) 
    
    for i in priorities.indices{
        withIndex.append((i,priorities[i]))
        remainTask[priorities[i]] += 1
    }
    
    var q = Deque(withIndex)
    
    var cnt:Int = 0
    var target:Int = 9
    
    while !q.isEmpty{
        
        let head = q.popFirst()!
        while remainTask[target] == 0 {
            target -= 1
        }
        
        if head.1 != target {
            
            q.pushLast(head)
            
        }
        
        else {
            
            remainTask[target] -= 1
            cnt += 1 
            
            if head.0 == location {
                break
            }
            
            
        }
        
        
    }
    
    
    
    return cnt
}