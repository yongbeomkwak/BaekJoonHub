let n = Int(readLine()!)!

var times: [Int] = [Int](repeating: 0, count: n)

var adj: [[Int]] = [[Int]](repeating: [], count: n)

var edges: [Int] = [Int](repeating: 0, count: n)

var queue: [Int] = []
var time: Int = 0
var dp: [Int] = [Int](repeating: 300 , count: n)

for i in 0..<n {
    
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 0..<input.count {
        
        if j == 0 {
            times[i] = input[j]
            dp[i] = times[i]
        } else if j == 1 {
            edges[i] = input[j]
            
            if edges[i] == 0 {
                queue.append(i)
                time = max(time,times[i])
            }
        
        } else {
            adj[input[j]-1].append(i)
        }
        
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

print(dp.max()!)
