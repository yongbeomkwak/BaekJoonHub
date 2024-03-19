let s1 = Array(readLine()!)
let s2 = Array(readLine()!)

let n = s1.count
let m = s2.count

var dp = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

var ans: Int = 0

for i in 1...n {
    for j in 1...m {
        
        if s1[i-1] == s2[j-1] {
            dp[i][j] = dp[i-1][j-1]+1
        }
        
        else {
            dp[i][j] = max(dp[i-1][j],dp[i][j-1])
        }
        
        ans = max(ans,dp[i][j])
        
    }
}

print(ans)
