func solution(_ n:Int) -> Int {
    
    let DIV = 1234567
    
    var dp: [Int] = [Int](repeating:0,count:100001)
    
    dp[1] = 1 
    
    for i in 2...n {
        dp[i] = (dp[i-1] + dp[i-2])%DIV
    }
    
    
    return dp[n]
}