import Foundation

let n = Int(readLine()!)!

var board: [[Int]] = []

for _ in 0..<n {
    
    let input = (Array(readLine()!).map{$0 == "Y" ? 1 : 0})
    
    board.append(input)
}

var friend: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            
            if i == j {
                continue
            }
            
            if board[i][j] == 1 || ( board[i][k] == 1 && board[k][j] == 1 ){
                friend[i][j] = 1
            }
            
        }
    }
}


print(friend.map{$0.reduce(0, +)}.max()!)
