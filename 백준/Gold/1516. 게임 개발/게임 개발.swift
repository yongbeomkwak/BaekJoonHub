let n = Int(readLine()!)!

var times: [Int] = [Int](repeating: 0, count: n+1)

var adj: [[Int]] = [[Int]](repeating: [], count: n+1)

var edges: [Int] = [Int](repeating: 0, count: n+1)

var queue: [Int] = []
var dp: [Int] = [Int](repeating: 100001, count: n+1)

for i in 1...n {
    
    var input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let _ = input.popLast()
    
    for j in 0..<input.count {
        
        if j == 0 {
            dp[i] = input[j]
            times[i] = input[j]
        } else {
            edges[i] += 1
            
            adj[input[j]].append(i)
        }
        
        
    }
    
}


for i in 1...n {
    if edges[i] == 0 {
        queue.append(i)
    }
}



var index: Int = 0



while index < queue.count {
    
    let now = queue[index]
    
    
    
    for next in adj[now] {
        
        edges[next] -= 1
        
        dp[next] = max(dp[next],dp[now] + times[next])
        
        if edges[next] == 0 {
            
            queue.append(next)
        }
        
    }
    
    
    index += 1
}


for i in 1...n {
    print(dp[i])
}
