let DIV = 10007

var dp:[[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: 1001), count: 1001)

dp[1][0] = 1
dp[1][1] = 1


let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,k) = (nk[0],nk[1])

if n > 1 {
    for i in 2...n {
        
        dp[i][0] = 1
        dp[i][i] = 1
        
        for r in 1...i-1 {
            dp[i][r] = (dp[i-1][r-1] + dp[i-1][r]) % DIV
        }
    }
}


print(dp[n][k])
