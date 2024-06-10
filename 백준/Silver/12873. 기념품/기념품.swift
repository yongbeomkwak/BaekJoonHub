import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}



struct Deque<T> {
    
    var enque: [T]
    var deque: [T] = []
    
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var count: Int {
        return enque.count + deque.count
    }
    
    mutating func appendLast(_ element: T) {
        enque.append(element)
    }
    
    mutating func appendFirst(_ element: T) {
        deque.append(element)
        
    }
    
    mutating func popLast() -> T? {
        
        var result: T?
        
        if enque.isEmpty {
            deque.reverse()
            result = deque.popLast()
            deque.reverse()
        } else {
            result = enque.popLast()
        }
        
        return result
        

        
    }
    
    mutating func popFirst() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
    }
}



var numbers: [Int] = []

let n = Int(readLine()!)!


for i in 1...n {
    numbers.append(i)
}

var deque: Deque<Int> = Deque(enque: numbers)



var t = 1

for i in 0..<n-1 {
    
    var out = ((t*t*t)-1)%deque.count
    
    while out > 0 {
        
        deque.appendLast(deque.popFirst()!)
        out -= 1
    }

    
    let _ = deque.popFirst()
    
    t += 1
}

print(deque.popFirst()!)

