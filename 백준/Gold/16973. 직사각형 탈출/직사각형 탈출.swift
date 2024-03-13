let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = [[Int](repeating: 0, count: m+1)]

for _ in 0..<n {
    board.append([0]+readLine()!.split{$0 == " "}.map{Int($0)!})
}

let hwsf = readLine()!.split{$0 == " "}.map{Int($0)!}

let (h,w,sr,sc,fr,fc) = (hwsf[0]-1,hwsf[1]-1,hwsf[2],hwsf[3],hwsf[4],hwsf[5])

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

struct Node {
    let x,y,dist: Int
}

var sum = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)


for i in 1...n {
    for j in 1...m {
        sum[i][j] = sum[i-1][j] + sum[i][j-1] - sum[i-1][j-1] + board[i][j]
    }
}

var index: Int = 0

var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m+1), count: n+1)

var ans = -1

var queue: [Node] = [Node(x:sr,y:sc,dist:0)]

visited[sr][sc] = true

while index < queue.count {
    
    let now = queue[index]
    
    let (x,y) = (now.x,now.y)
    
    
    if x == fr && y == fc {
        ans = now.dist
        break
    }
    
    for i in 0..<4 {
        let nx = x+dx[i] , ny = y + dy[i]
        if nx < 1 || nx + h > n || ny < 1 || ny + w > m { // 범위 벗어남 체크
            continue
        }
        
        if visited[nx][ny] {
            continue
        }
        
        // 이동하는 중간에 벽이 있음
        if sum[nx+h][ny+w] - sum[nx+h][ny-1]  - sum[nx-1][ny+w] + sum[nx-1][ny-1] != 0 {
            continue
        }
        
        queue.append(Node(x:nx,y:ny,dist: now.dist+1))
        visited[nx][ny] = true
        
    }
    
    index += 1
    
    
}


print(ans)
