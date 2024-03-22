let k = Int(readLine()!)!
let wh = readLine()!.split{$0 == " "}.map{Int($0)!}
let (w,h) = (wh[0],wh[1])

var board = [[Int]]()

let knight = [(-1,-2),(-2,-1),(1,-2),(2,-1),(1,2),(2,1),(-1,2),(-2,1)]

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

for _ in 0..<h {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var ans:Int = -1

var index: Int = 0

var queue: [(Int,Int,Int)] = [(0,0,k)]

let MAX = 100000

var dist: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: MAX, count: k+1), count: w), count: h)



dist[0][0][k] = 0

while index < queue.count {
    
    let (x,y,z) = (queue[index].0,queue[index].1,queue[index].2)
    
    for i in 0..<8 { // 나이트로 이동
        let (nx,ny) = (x+knight[i].0,y+knight[i].1)
        
        if nx < 0 || ny < 0 || nx >= h || ny >= w {
            continue
        }
        
        if board[nx][ny] == 1 {
            continue
        }
        
        if z <= 0 {
            continue
        }
        
        if dist[nx][ny][z-1] > dist[x][y][z] + 1 {
            dist[nx][ny][z-1] = dist[x][y][z] + 1
            queue.append((nx,ny,z-1))
        }
        
    }
    
    for i in 0..<4 {
        let (nx,ny) = (x+dx[i],y+dy[i])
        
        if nx < 0 || ny < 0 || nx >= h || ny >= w {
            continue
        }
        
        if board[nx][ny] == 1 {
            continue
        }
        
        if dist[nx][ny][z] > dist[x][y][z] + 1 {
            dist[nx][ny][z] = dist[x][y][z] + 1
            queue.append((nx,ny,z))
        }
    }
    

    index += 1
}


if dist[h-1][w-1].min()! != MAX{
    print(dist[h-1][w-1].min()!)
} else {
    print(-1)
}
