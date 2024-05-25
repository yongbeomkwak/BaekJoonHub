import Foundation


let n = Int(readLine()!)!

var board: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (x,y) = (input[0],input[1])
    
    for i in x..<x+10 {
        for j in y..<y+10 {
            board[i][j] = true
        }
    }
}

print(board.flatMap{$0}.filter{$0}.count)
