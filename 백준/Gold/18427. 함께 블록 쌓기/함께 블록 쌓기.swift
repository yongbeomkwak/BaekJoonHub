let nmh = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,h) = (nmh[0],nmh[1],nmh[2])

var dp = [[Int]](repeating: [1] + [Int](repeating: 0, count: h), count: n+1) //

let DIV = 10007


for i in 1...n {
    let block = readLine()!.split{$0 == " "}.map{Int($0)!}
    
        for j in 1...h {
            
            for b in block {
                if j >= b {
                    dp[i][j] += dp[i-1][j-b]
                    dp[i][j] %= DIV
                }
            
            }
            dp[i][j] = (dp[i][j]+dp[i-1][j])%DIV // 위 블럭을 안쓸 때
        }
        
}


print(dp[n][h])
