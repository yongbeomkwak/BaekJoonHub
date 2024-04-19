let n = Int(readLine()!)!

var task: [(Int,Int)] = [(0,0)]

var dp: [Int] = [Int](repeating: 0, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    task.append((input[0],input[1]))
}

for i in 1...n {
    
    dp[i] = max(dp[i-1],dp[i])
    
    let endDate = i + task[i].0-1
    
    if endDate <= n {
        dp[endDate] = max(dp[endDate],dp[i-1]+task[i].1)
    }
    
}

print(dp[n])
