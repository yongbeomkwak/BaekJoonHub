import Foundation

struct Queue<T> {
    
    var enque:[T]
    var deque:[T] = []
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var first:T? {
        
        if deque.isEmpty{
            return enque.first
        }
        
        return deque.last
    }
    
    init(_ enque:[T]){
        self.enque = enque
    }
    
    mutating func pushLast(_ element:T){
        enque.append(element)
    }
    
    mutating func popFirst() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
    }
    
}



func solution(_ order:[Int]) -> Int {
    
    let n = order.count
    var belt:[Int] = Array(1...n)
    var index:Int = 0
    
    var q = Queue(belt)
    var stk:[Int] = []
    var ans:Int = 0
    
    var prev:Int = -1
    
    while !q.isEmpty {
       
        if !stk.isEmpty && stk.last! == order[index] {
            index += 1
            let _ = stk.popLast()!
        }
        
        let curr = q.popFirst()!
        
        if curr == order[index] {
            index += 1
        }
        
        else {
            stk.append(curr)
        }
        
    }
    
    while !stk.isEmpty {
        
        if stk.popLast()! == order[index] {
            index += 1
        }
        else {
            break
        }
    }

    
    return index
}