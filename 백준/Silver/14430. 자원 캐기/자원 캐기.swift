let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var map : [[Int]] = []

for _ in 0..<n{
    map.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for i in 0..<n{
    for j in 0..<m {
        
        
        if i != 0  {
            dp[i][j] = dp[i-1][j]
        }
        
        if j != 0 {
            dp[i][j] = max(dp[i][j],dp[i][j-1])
        }
        
        
        dp[i][j] += map[i][j]
        
    }
}

print(dp[n-1][m-1])

