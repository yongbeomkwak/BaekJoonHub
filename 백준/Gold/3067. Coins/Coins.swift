var tc = Int(readLine()!)!

repeat {
    
    let n = Int(readLine()!)!
    
    let coins = [0] + readLine()!.split{$0 == " "}.map{Int($0)!}
    let target = Int(readLine()!)!

    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: target+1), count: n+1)
    
    dp[0][0] = 0
    
    for i in 1...n {
        let coin = coins[i]
        dp[i][0] = 1
        for j in stride(from:1,through: target,by:1) {
            
            
            if j >= coin {
                dp[i][j] = dp[i-1][j] + dp[i][j-coin]
            } else {
                dp[i][j] = dp[i-1][j]
            }
            
            
        }
    }

    print(dp[n][target])
    
    tc -= 1
} while tc > 0
            
