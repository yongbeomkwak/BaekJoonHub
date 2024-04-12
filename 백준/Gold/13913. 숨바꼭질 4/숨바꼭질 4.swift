import Foundation

let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

var queue: [Int] = []

var dist: [Int] = [Int](repeating: 0, count: 100_001)
var parent: [Int] = [Int](repeating: 0, count: 100_001)

queue.append(n)
var index = 0

while index < queue.count {
    
    let now = queue[index]
    
    if now == k {
        print(dist[now])
        
        var arr: [Int] = []
        
        var pos = now

        while pos != n {
            arr.append(pos)
            pos = parent[pos]
        }
        arr.append(pos)
        print(arr.reversed().map{String($0)}.joined(separator: " "))
        break
    }
    
    for next in [now-1,now+1,now*2] {
        
        if  0 <= next && next <= 100000 && dist[next] == 0 {
            dist[next] = dist[now] + 1
            parent[next] = now
            queue.append(next)
        }
        
    }
    
    
    
    index += 1
}
