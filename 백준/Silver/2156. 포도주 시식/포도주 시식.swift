
let n = Int(readLine()!)!

var wines: [Int] = [Int](repeating: 0, count: 10001)


for i in 0..<n {
    wines[i+1] = Int(readLine()!)!
}

var dp: [Int] = [Int](repeating: 0, count: 10001)
 


dp[1] = wines[1]
dp[2] = dp[1] + wines[2]


if n > 2  {
    
    for i in 3...n {
        
        dp[i] = max(dp[i-2], dp[i-3] + wines[i-1]) + wines[i]
        
        dp[i] = max(dp[i-1],dp[i])
    }
}


print(dp[n])

