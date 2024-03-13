let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

func melting() -> Int {
    var melt: [(Int,Int)] = []
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    var queue: [(Int,Int)] = [(0,0)]
    
    var index: Int = 0
    
    let dx = [0,0,-1,1]
    let dy = [1,-1,0,0]
    
    while index < queue.count {
        
        let now = queue[index]
        let (x,y) = (now.0,now.1)
        
        for i in 0..<4 {
            
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            
            if visited[nx][ny] == true {
                continue
            }
            
            visited[nx][ny] = true
            
            if board[nx][ny] == 1 {
                melt.append((nx,ny))
            } else {
                queue.append((nx, ny))
            }
            
        }
        
        index += 1
        
    }
    
    // 녹은 것들은 이제 공기로 처리
    for (i,j) in melt {
        board[i][j] = 0
    }
    
    return melt.count
}

var time = 0
var finalCheese = 0

while true {
 
    let melt = melting()
    
    if melt == 0 {
        print("\(time)\n\(finalCheese)")
        break
    }
    finalCheese = melt
    time += 1
}


