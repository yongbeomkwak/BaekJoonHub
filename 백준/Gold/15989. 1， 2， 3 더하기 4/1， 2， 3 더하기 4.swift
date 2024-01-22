var t = Int(readLine()!)!

var dp : [[Int]] = [[Int]](repeating: [0,0,0,0], count: 10001)
dp[1][1] = 1 // i를 만들 때 마지막이 j로 끝날 때 , 중복 제거를 위해 오름차순으로 한다
dp[2][1] = 1 // 1+1
dp[2][2] = 1 // 2
dp[3][1] = 1 // 1 1 1
dp[3][2] = 1 // 1 2
dp[3][3] = 1 // 3

for i in stride(from: 4, through: 10000, by: 1) {
    
    dp[i][1] = dp[i-1][1] // i가 1로 끝날려면 i-1이 1로 끝날 때 (오름차순이기 때문에)
    dp[i][2] = dp[i-2][1] + dp[i-2][2] // i가 2로 끝날려면 i-2가 1~2까지
    dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3]
    
}

repeat {

    let n = Int(readLine()!)!

    print(dp[n][1]+dp[n][2]+dp[n][3])
    
    t-=1
    
} while t > 0
