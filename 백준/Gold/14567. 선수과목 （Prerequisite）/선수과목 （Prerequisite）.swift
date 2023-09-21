import Foundation


struct Queue<T> {
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



let nm = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}

let n = nm[0]
let m = nm[1]

var preSubjects:[Int] = [Int](repeating:0,count: n+1)

var adj:[[Int]] = [[Int]](repeating:[Int](),count: n+1)

for _ in 0..<m {
    let ab = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    
    let a = ab[0]
    let b = ab[1]
    
    preSubjects[b] += 1
    adj[a].append(b)
    
}

var q = Queue([(Int,Int)]())

var ans:[Int] = [Int](repeating:0,count: n+1)

for i in 1...n{
    
    if preSubjects[i] == 0 {
        q.pushLast((i,1))
        ans[i] = 1
    }
}




while !q.isEmpty {
    
    let (curr,semester) = q.popFirst()!
    
    for nxt in adj[curr] {
        
        preSubjects[nxt] -= 1
        
        
        if preSubjects[nxt] == 0 {
            ans[nxt] = semester + 1
            q.pushLast((nxt, semester+1))
        }
        
    }
    
    
}


print(Array(ans[1..<ans.count]).map{String($0)}.joined(separator:" ") )
