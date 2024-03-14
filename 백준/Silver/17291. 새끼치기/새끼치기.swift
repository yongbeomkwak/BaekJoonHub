// 2월에 1마리 탄생
// 매년 1월에 분열
// 홀수년도에 탄생한 벌레는 3번 분열 시, 짝수년도에 태어난 개체는 4번 분열 시망

var dp = [[Int]](repeating: [0,0], count: 30) // dp[i][0] = i년에 태어난 벌레 수 dp[i][1] = 존재하던 벌래

dp[1][0] = 1


let n = Int(readLine()!)!

for i in 1...n {
    
    dp[i][0] += (dp[i-1][0] + dp[i-1][1])
    dp[i][1] += (dp[i-1][0] + dp[i-1][1])
    if i % 2 != 0 {
        dp[i+3][1] -= dp[i][0]
    } else {
        dp[i+4][1] -= dp[i][0]
    }
    
}


print(dp[n][0]+dp[n][1])
 
 

