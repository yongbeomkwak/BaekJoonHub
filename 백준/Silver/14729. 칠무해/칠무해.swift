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
        
        return deque.last
        
    }
    
}

let n = Int(readLine()!)!

// FIFO

//var queue = Queue<Float>([])

var arr : [Float] = []

for _ in 0..<n {
    arr.append(Float(readLine()!)!)
}

arr.sort()

for i in 0..<7 {
    print(String(format:"%.3f",arr[i]))
}
