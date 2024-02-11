func solution(_ n:Int) -> Int {
    
    let DIV = 1234567
    
    var dp : [Int] = [Int](repeating:0,count:2001)
    
    dp[1] = 1
    dp[2] = 2
    
    
    for i in stride(from:3,through:n,by:1) {
        dp[i] = (dp[i-1] + dp[i-2])%DIV
    }
    
    return dp[n]
}