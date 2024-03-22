var nmr = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,r) = (nmr[0],nmr[1],nmr[2])

var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

func rotate(_ x:Int,_ y: Int,_ h:Int,_ w:Int,_ rotateCnt: Int,_ isCounter: Bool) {
    
    
    
    let loopCounter = min(x+h,y+w)/2
        

    
    for l in 0..<loopCounter {
        var tmp = [Int]()
        let left = y+l
        let top = x+l
        let rihgt = y+w-1-l
        let bottom = x+h-1-l
        
        for i in stride(from: left, to: rihgt, by: 1) {
            tmp.append(board[top][i])
        }
        
        for i in stride(from: top, to: bottom, by: 1) {
            tmp.append(board[i][rihgt])
        }
        
        for i in stride(from: rihgt, to: left, by: -1) {
            tmp.append(board[bottom][i])
        }
        
        for i in stride(from: bottom, to: top, by: -1) {
            tmp.append(board[i][left])
        }
        
        let len = tmp.count
        
        if len == 0 {
            break
        }
        
        let move = rotateCnt%len
        
        tmp = isCounter ?  Array(tmp[move..<len] + tmp[0..<move]) : Array(tmp[len-move..<len] + tmp[0..<len-move])
        
        var k = 0
        
        for i in stride(from: left, to: rihgt, by: 1) {
            board[top][i] =  tmp[k]
            k += 1
        }
        
        for i in stride(from: top, to: bottom, by: 1) {
            board[i][rihgt] =  tmp[k]
            k += 1
        }
        
        for i in stride(from: rihgt, to: left, by: -1) {
            board[bottom][i] = tmp[k]
            k += 1
        }
        
        for i in stride(from: bottom, to: top, by: -1) {
            board[i][left] = tmp[k]
            k += 1
        }
        
        
        
        
    }
    
}


rotate(0, 0, n, m, r, true)

for i in 0..<n {
    print(board[i].map{String($0)}.joined(separator: " "))
}
