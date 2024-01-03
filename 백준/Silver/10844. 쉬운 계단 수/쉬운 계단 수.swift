let n = Int(readLine()!)!

let DIV =  1000000000

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101) // dp[i][j] = i번 자릿수가 j로 끝나는 경우


for i in 1...9 {
    dp[1][i] = 1
}

// 길이가 1인 것은 0을 제외하고 모두 계단 수


if n > 1 {
    for i in 2...n {
        
        for j in 0...9 {
            
            if j == 0 { // 0은 이전 끝 자리가 1로 끝날 때
                dp[i][j] = dp[i-1][1]
            }
            
            else if 1...8 ~= j { // 1~8 부터는 -1 +1 2개의 경우
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1])%DIV
            }
            
            else { // 9는 이전 끝 자리가 8로 끝날 때
                dp[i][j] = dp[i-1][8]
            }
            
        }
    }
}

print(dp[n].reduce(0,{ ($0 + $1) % DIV }))