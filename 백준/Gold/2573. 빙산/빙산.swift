struct Coord {
    let x,y : Int
}

let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = []

var queue: [Coord] = []

for i in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 0..<m {
        if input[j] != 0 {
            queue.append(Coord(x:i,y:j))
        }
    }
    
    board.append(input)
    
}

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

func check(_ c:Coord,_ visited: inout [[Bool]]) -> Int {
    
   
    visited[c.x][c.y] = true
    var queue = [c]
    var index:Int = 0

    while index < queue.count {
        
        
        let (x,y) = (queue[index].x,queue[index].y)
        
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if board[nx][ny] == 0 {
                continue
            }
            
            if !visited[nx][ny] {
                queue.append(Coord(x:nx,y:ny))
                visited[nx][ny] = true
            }
            
        }
        
        index += 1
        
    }
    
    

    
  return 1
}

var year = 1


while true {
    
    let queueSize = queue.count
    
    var melting: [Coord] = []
    var tmpQueue: [Coord] = []
    var index = 0
    var group = 0
    
    while index < queueSize {
    
        let now = queue[index]
        let (x,y) = (now.x,now.y)
        var nowHeight = board[x][y]
        
        for i in 0..<4 {
            
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if board[nx][ny] == 0 {
                nowHeight -= 1
            }
        
        }
        
        
        if nowHeight <= 0 {
            melting.append(now)
        } else {
            board[x][y] = nowHeight
            tmpQueue.append(Coord(x:x,y:y))
        }
        index += 1
    }
    
    for melt in melting {
        board[melt.x][melt.y] = 0
    }

    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for remain in tmpQueue {
        
        let (x,y) = (remain.x,remain.y)
        
        if visited[x][y] {
            continue
        }
        
        group += check(remain, &visited)
        
    }
    
    if group >= 2 {
        print(year)
        break
    }
    
    if group == 0 {
        print(0)
        break
    }
    
    queue = tmpQueue
    year += 1
}


