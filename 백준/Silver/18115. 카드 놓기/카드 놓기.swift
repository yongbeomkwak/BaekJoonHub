import Foundation

struct Deque<T> {
    public var enqueue: [T]
    public var dequeue: [T] = []
    
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

    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let n = Int(readLine()!)!

let state = readLine()!.split{$0 == " "}.map{Int($0)!}

var result = Array((1...n).reversed())

var deque = Deque<Int>([])

for i in stride(from: n-1, to: -1, by: -1) {
    
    if state[i] == 1 {
        deque.pushFirst(result[i])
    } else if state[i] == 2{
        deque.pushFirst(result[i])
        let count = deque.dequeue.count
        deque.dequeue.swapAt(count-2, count-1)
    } else {
        deque.pushLast(result[i])
    }
}
print((deque.dequeue.reversed() + deque.enqueue).map{String($0)}.joined(separator: " "))


