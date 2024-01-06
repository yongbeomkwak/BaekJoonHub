
let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])

var board: [[Int]] = [[Int](repeating: 0, count: m+1)]
var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

for _ in 0..<n {
    board.append( [0] + readLine()!.split{$0 == " "}.map{Int($0)!})
}

var ans: Int = -1

for i in 1...n {
    for j in 1...m {
        dp[i][j] = dp[i-1][j-1] // 일단 대각선
        dp[i][j] = max(dp[i-1][j],dp[i][j]) // 윗칸 칸
        dp[i][j] = max(dp[i][j-1],dp[i][j]) // 왼쪽 칸
        dp[i][j] += board[i][j]
    }
}

print(dp[n][m])


