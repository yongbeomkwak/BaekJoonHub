let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])


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

var graph : [[(node:Int,weight:Int)]] = [[(node:Int,weight:Int)]](repeating: [], count: n+1)


var highest = 0
for _ in 0..<m {
    
    let abc = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (a,b,c) = (abc[0],abc[1],abc[2])
    
    graph[a].append((node: b, weight: c))
    graph[b].append((node: a, weight: c))

    highest = max(highest,c)

}

let sd = readLine()!.split{$0 == " "}.map{Int($0)!}

let (start,dest) = (sd[0],sd[1])

var low: Int = 0
var answer: Int = 0

while low <= highest {
    
    let mid = (low+highest)/2
    
    var visited: [Bool] = [Bool](repeating: false, count: n+1)
    visited[start] = true
    
    var pass = false
    
    var q = Queue<Int>([start])

    
    while !q.isEmpty {
        
        let curr = q.pop()!
        
        if curr == dest { // 도착함
            
            pass = true
            
            break
        }
        
        for (next,weight) in graph[curr] {
            
            // 방문 전이고, 버틸수 있는 무게가 mid보다 갖거나 크면
            if !visited[next] && weight >= mid {
                visited[next] = true
                q.push(next)
            }
            
        }
        
    }
    
    
    if pass { // 목적지에 도착했다면
        answer = mid
        low = mid+1
        
    } else { // 도착 못했다면 더 줄여야함
        highest = mid-1
    }
    
    
}


print(answer)


