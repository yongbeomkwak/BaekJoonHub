var n = Int(readLine()!)!

var arr = [0] + readLine()!.split{$0 == " "}.map{Int($0)!}

var dp = [Int](repeating: 0, count: n+1)

if n == 1 {
    print(0)
}

else {
    for i in 1...n {
        
        let jump = arr[i]
        
        if jump == 0 { // 점프 불가
            continue
        }
        
        for j in 1...jump {
            
            if i != 1 , dp[i] == 0 { // 아직 도착한 경우가 없으면
                break
            }
            
            if i+j <= n {
                
                if dp[i+j] == 0 {
                    dp[i+j] = dp[i]+1 // 최초 도착
                    continue
                }
                
                dp[i+j] = min(dp[i+j],dp[i]+1)
            }
            
            else {
                break
            }
        }
    }
    
    print(dp[n] == 0 ? -1 : dp[n])
}





