var tc = Int(readLine()!)!


repeat {
    
    let nd = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (n,d) = (nd[0],nd[1])
    let k = abs(d / 45)
    
    var board: [[Int]] = []
    
    for _ in 0..<n {
        board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
    }
    
    func roate(_ dir:Int) {
        
        var tmp = board
        
        let half = tmp.count/2
        
        if dir == -1 {
            
            for i in 0..<n { // 세로 -> 주 대각선
                tmp[i][i] = board[i][half]
            }
            
            for i in 0..<n { // 주대각선 -> 가로
                tmp[half][i] = board[i][i]
            }
            
            for i in 0..<n { // 가로 -> 부 대각선
                tmp[n-1-i][i] = board[half][i]
            }
            
            for i in 0..<n { // 부대각선 -> 세로
                tmp[n-1-i][half] = board[n-1-i][i]
            }
            
            
        } else {
            
            for i in 0..<n { // 세로 -> 부 대각선
                tmp[i][n-1-i] = board[i][half]
            }
            
            for i in 0..<n { // 부대각선 -> 가로
                tmp[half][n-1-i] = board[i][n-1-i]
            }
            
            for i in 0..<n { // 가로 -> 주 대각선
                tmp[n-1-i][n-1-i] = board[half][n-1-i]
            }
            
            for i in 0..<n { // 주 대각선 -> 세로
                tmp[n-1-i][half] = board[n-1-i][n-1-i]
            }
            
        }
        
        board = tmp
        
    }
    
    for _ in 0..<k {
        if d > 0 {
            roate(1) // 시계 방향
        } else {
            roate(-1) // 반시계
        }
    }
    
    for i in 0..<n {
        print(board[i].map{String($0)}.joined(separator: " "))
    }
    
    
    tc -= 1
} while tc > 0
