let nmr = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,r) = (nmr[0],nmr[1],nmr[2])

var board : [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}


func rotateCounterClock(_ roateCnt: Int) {
    
    
    let loopCount = min(n,m)/2
    
    
    
    for loop in 0..<loopCount { // 루프는 현재 가르키고 있는 태두리와 같다
        
        var tmp = [Int]()
        
        let endOfRight = m-loop-1
        let endOfBottom = n-loop-1
        
        for i in loop..<endOfRight { // 루프의 가장위 가로 담기
            tmp.append(board[loop][i])
        }
      
        for i in loop..<endOfBottom {
            tmp.append(board[i][endOfRight]) // 오른쪽 끝 세로 담기
        }
    
        // 아래쪽 끝을 오른쪽부터 담기
        for i in stride(from: endOfRight-1, through:loop, by: -1) {
            tmp.append(board[endOfBottom][i+1])
        }
        
        //왼쪽 끝을 아래부터 담기
        for i in stride(from: endOfBottom-1, through: loop, by: -1) {
            tmp.append(board[i+1][loop])
        }
        
        
        let len = tmp.count
        let move = roateCnt%len
        
        tmp = Array(tmp[move..<len] + tmp[0..<move])
        
        var k = 0
        
        
        for i in loop..<endOfRight { // 루프의 가장위 가로 담기
            board[loop][i] = tmp[k]
            k+=1
        }
      
        for i in loop..<endOfBottom {
            board[i][endOfRight] = tmp[k] // 오른쪽 끝 세로 담기
            k+=1
        }
        
        
        // 아래쪽 끝을 오른쪽부터 담기
        for i in stride(from: endOfRight-1, through:loop, by: -1) {
            board[endOfBottom][i+1] = tmp[k]
            k+=1
        }
        
        //왼쪽 끝을 아래부터 담기
        for i in stride(from: endOfBottom-1, through: loop, by: -1) {
            board[i+1][loop] = tmp[k]
            k+=1
        }
        
        
    }
    
    
}


rotateCounterClock(r)

for i in 0..<n {
    print(board[i].map{String($0)}.joined(separator: " "))
}
