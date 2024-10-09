import Foundation

var s1 = Array(readLine()!)
var s2 = Array(readLine()!)

let len = max(s1.count, s2.count)

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: len+1), count: len+1)

var ans: Int = 0

for i in 1...s1.count {
    for j in 1...s2.count {
        
        if s1[i-1] == s2[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
        
        ans = max(ans, dp[i][j])
    }
}

print(ans)
