let DIV = 1000000
// 지각 2번 이상 , 결석을 세번 연속

let n = Int(readLine()!)!

var dp = Array(repeating: Array(repeating:Array(repeating: 0, count: 3  ),count:2),count:n+1)
// dp[i][j][k] = i날까지 지각 j , 연속 결석 k 번

dp[1][0][0] = 1 // 첫 날에 지각 x , 연속 결석 x
dp[1][1][0] = 1
dp[1][0][1] = 1


for i in stride(from:2,through: n,by:1) {
    
    // 지각을 한번도 안하려면 , 이전
    dp[i][0][0] = (dp[i-1][0].reduce(0, { ($0+$1)%DIV }))
    
    dp[i][0][1] = dp[i-1][0][0]
    
    dp[i][0][2] = dp[i-1][0][1]
    
    dp[i][1][0] = ((dp[i-1][0].reduce(0, { ($0+$1)%DIV })) + (dp[i-1][1].reduce(0, { ($0+$1)%DIV })))%DIV
    
    dp[i][1][1] = dp[i-1][1][0]
    
    dp[i][1][2] = dp[i-1][1][1]
    
}

print(((dp[n][0].reduce(0, { ($0+$1)%DIV })) + (dp[n][1].reduce(0, { ($0+$1)%DIV })))%DIV)
