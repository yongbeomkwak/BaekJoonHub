var tc = Int(readLine()!)!

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

let MAX = 10000000

repeat {
    
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (w,h) = (input[0],input[1])
    
    var board: [[Character]] = []
    
    var sQueue: [(x:Int,y:Int)] = []
    var fireQueue: [(x:Int,y:Int)] = []
    
    var escapeTime : [[Int]] = [[Int]](repeating: [Int](repeating: MAX, count: w), count: h)
    var spreadTime : [[Int]] = [[Int]](repeating: [Int](repeating: MAX, count: w), count: h)
    
    for i in 0..<h {
        let input = Array(readLine()!)
        for j in 0..<w {
            if input[j] == "@"{
                escapeTime[i][j] = 1
                sQueue.append((x:i,y:j))
            } else if input[j] == "*" {
                spreadTime[i][j] = 1
                fireQueue.append((x:i,y:j))
            }
            
        }
        board.append(input)
    }
    
   
    
    var index: Int = 0
    while index < sQueue.count {
        
        let (x,y) = (sQueue[index].x,sQueue[index].y)
        
        
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || ny < 0 || nx >= h || ny >= w {
                continue
            }
            
            if board[nx][ny] == "." && escapeTime[nx][ny] > escapeTime[x][y]+1 {
                escapeTime[nx][ny] = escapeTime[x][y]+1
                sQueue.append((x: nx, y: ny))
            }
            
        }
        
        index += 1
    }
    
    index = 0
    
    
    
    while index < fireQueue.count {
        
        let (x,y) = (fireQueue[index].x,fireQueue[index].y)
        
        
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || ny < 0 || nx >= h || ny >= w {
                continue
            }
            
            if board[nx][ny] != "#" && spreadTime[nx][ny] > spreadTime[x][y]+1 {
                spreadTime[nx][ny] = spreadTime[x][y]+1
                fireQueue.append((x: nx, y: ny))
            }
            
        }
        
        index += 1
    }
    

    
    var time = MAX

    for i in 0..<w {
        
        if escapeTime[0][i] < spreadTime[0][i] {
            time = min(time,escapeTime[0][i])
        }
        
        if escapeTime[h-1][i] < spreadTime[h-1][i] {
            time = min(time,escapeTime[h-1][i])
        }
        
        
    }
    
    for i in 0..<h {
        
        if escapeTime[i][0] < spreadTime[i][0] {
            time = min(time,escapeTime[i][0])
        }
        
        if escapeTime[i][w-1] < spreadTime[i][w-1] {
            time = min(time,escapeTime[i][w-1])
        }
        
        
    }
    
    print(time == MAX ? "IMPOSSIBLE" : time)
    
    
    tc -= 1
} while tc > 0
