var tc = Int(readLine()!)!

var dp = Array(repeating: Array(repeating:0,count:10) ,count:66)

for i in 0...9 {
    dp[1][i] = 1
}

// dp[i][j] = 길이 i일때 끝자리가 j일 때

for i in 2...65{
    
    for j in 0...9 {
        if j == 0 { // 끝이 0이면 항상 1
            dp[i][j] = 1
            continue
        }
        
        for k in 0...j { // 끝이 j가 되기위해선 이전 끝자리가 0~j까지가 가능하다
            dp[i][j] += dp[i-1][k]
        }
        
        
    }
}


repeat {
    
    let n = Int(readLine()!)!
    
    print(dp[n].reduce(0,+))
    
    tc -= 1
} while tc > 0
