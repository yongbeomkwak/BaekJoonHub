

var tc: Int = 1
while let input = readLine() {
    
    if input == "0" {
        break
    }
    
    var n = Int(input)!
    
    
    var dp: [[Int]] =  []
    
    for _ in 0..<n {
        
        dp.append(readLine()!.split{$0 == " "}.map{Int($0)!})
        
    }
    
    
    // 두 번째 줄
    
    dp[1][0] += dp[0][1]
    dp[1][1] += min(dp[0][1],dp[0][1]+dp[0][2],dp[1][0])
    dp[1][2] += min(dp[0][1],dp[0][1]+dp[0][2],dp[1][1])
  
    for i in 2..<n {
        
        dp[i][0] += min(dp[i-1][0],dp[i-1][1])
        dp[i][1] += min(dp[i-1][0],dp[i-1][1],dp[i-1][2],dp[i][0])
        dp[i][2] += min(dp[i-1][1],dp[i-1][2],dp[i][1])
        

    
        
        
        
    }
    
    
    // 출력
    
    print("\(tc). \(dp[n-1][1])")
    
    tc += 1
}

