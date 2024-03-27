import Foundation

struct Queue<T> {
    
    var enque: [T]
    var deque: [T] = []
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var count: Int {
        return enque.count + deque.count
    }
    
    var front: T? {
        
        if deque.isEmpty {
            return enque.first
        } else {
            return deque.last
        }
        
    }
    
    init(_ enque:[T]) {
        self.enque = enque
    }
    
    mutating func push(_ element:T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
        
    }
    
}


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    //FIFO 
    var ans: [Int] = []
    var queue = Queue<Int>(progresses)
    
    var day: Int = 0 
    var index: Int = 0 
    let n = speeds.count
    var endJobCount: Int = 0
    
    while !queue.isEmpty && index < n {

        if queue.front! + speeds[index] * day >= 100 {
            
            let _ = queue.pop()
            index += 1
            endJobCount += 1 
        } else {
            if endJobCount != 0 {
                ans.append(endJobCount)
            }
            
            endJobCount = 0
            day += 1 
        }
        
    } 
    
    if endJobCount != 0 {
        ans.append(endJobCount)
    }
    
    
    return ans
}