import Foundation


struct Deque<T> {
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

    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map({Int(String($0))!})

var q = Deque(arr.enumerated().map({($0+1 ,$1)})) // (index,data)


var roop:Int = 1

var answer:[String] = []

while !q.isEmpty {
        
    if roop > 0 { // 양수면 앞에서 꺼내서 뒤로
        
        for _ in 0..<roop - 1 { // roop-1 때는 진짜 쓸 데이터 이므로 그 전 까지
            q.pushLast(q.popFirst()!)
        }
        let last:(Int,Int)? = q.popFirst()
        answer.append(String(last!.0))
        roop = last!.1 // # 다음 순회
    }

    else { // 음수면 뒤에서 꺼내서 앞으로
        for _ in 0..<(roop * -1 ) - 1 {// roop-1 때는 진짜 쓸 데이터 이므로 그 전 까지
            q.pushFirst(q.popLast()!)
        }
        let last:(Int,Int)? = q.popLast()
        answer.append(String(last!.0))
        roop = last!.1 // # 다음 순회
    }
    
}

print(answer.joined(separator: " "))
