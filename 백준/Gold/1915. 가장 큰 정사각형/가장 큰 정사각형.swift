let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])

var board: [[Int]] = [[Int](repeating: 0, count: m+1)]

for _ in 0..<n {
    board.append([0] + Array(readLine()!).map{Int(String($0))!})
}

var ans: Int = 0

for i in 1...n {
    for j in 1...m {
        
        if board[i][j] == 1 {
            board[i][j] = min(board[i-1][j-1],board[i-1][j],board[i][j-1])+1
        }
        
        ans = max(ans,board[i][j])
    }
}

print(ans*ans)
