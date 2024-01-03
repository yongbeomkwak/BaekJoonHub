
let nm = readLine()!.split{$0 == " "}.map({Int($0)!})
let (n,m) = (nm[0], nm[1])

var board: [[Int]] = [[Int](repeating: 0, count: n+1)]

for _ in 0..<n {
    
    var tmp = [0] + readLine()!.split{$0 == " "}.map({Int($0)!})
    



    board.append(tmp)
    
}

for i in 1...n {
    for j in 1...n {
        board[i][j] += board[i][j-1] + board[i-1][j] - board[i-1][j-1]
    }
}

for _ in 0..<m {
    let xy = readLine()!.split{$0 == " "}.map({Int($0)!})
    let x1 = xy[0]
    let y1 = xy[1]
    let x2 = xy[2]
    let y2 = xy[3]
    
    print(board[x2][y2] - board[x1-1][y2] - board[x2][y1-1] + board[x1-1][y1-1])
}
