let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])

var board: [[Int]] = [[Int](repeating: 0, count: m+1)]

for _ in 0..<n{
    board.append([0] + readLine()!.split{$0 == " "}.map{Int($0)!})
}

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

for i in 1...n {
    for j in 1...m {
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + board[i][j]
    }
}

let k = Int(readLine()!)!

for _ in 0..<k {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
    
    
    print(dp[x2][y2] - dp[x2][y1-1] - dp[x1-1][y2] + dp[x1-1][y1-1])
    
}
