import Foundation

struct Queue<T> {
    
    var enque:[T]
    
    var deque:[T] = []
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    
    var front:T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return enque.last 
        
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
        
    }
    
    mutating func push(_ element:T) {
        
        enque.append(element)
    }
    

    
    
}



func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var rest: [Int] = []
    
    for (i,p) in progresses.enumerated() {
        rest.append( (100-p-1)/(speeds[i])+1 ) //
    }
    
    var q = Queue<Int>(rest)
    
    var result:[Int] = []
    var target:Int = q.pop()!
    
    var count: Int = 1
    
    while !q.isEmpty {
        
        let curr = q.pop()!
        
        
        if target >= curr {
            count += 1 
        }
        
        else {
            result.append(count)
            target = curr
            count = 1 
        }
        
    }
    
    result.append(count)
    
    
    return result
}