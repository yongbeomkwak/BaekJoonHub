let n = Int(readLine()!)!

var arr: [[Int]] = []
var dp: [[Int]] = [[Int]](repeating:[Int](repeating: 0, count: n+1),count:n+1)

for i in 0..<n {
    arr.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

dp[0][0] = arr[0][0]

if n > 1 {
    for i in 1..<n {
        
        dp[i][0] += dp[i-1][0] + arr[i][0]
        dp[i][i] += dp[i-1][i-1] + arr[i][i]
        for j in stride(from: 0, through:i, by: 1) {
            
            if j == 0 || j == i {
                continue
            }

            
            dp[i][j] = max(dp[i-1][j-1],dp[i-1][j]) + arr[i][j]
        }
    }
}

print(dp[n-1].max()!)
