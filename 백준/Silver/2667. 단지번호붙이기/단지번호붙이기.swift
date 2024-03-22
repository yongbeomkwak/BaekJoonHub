let n = Int(readLine()!)!

var board: [[Character]] = []


for _ in 0..<n {
    board.append(Array(readLine()!))
}

var visited:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var result: [Int] = []

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func dfs(_ x:Int,_ y:Int) -> Int {
    visited[x][y] = true
    var count: Int = 1
    
    for i in 0..<4 {
        let (nx,ny) = (x+dx[i],y+dy[i])
        
        if nx < 0 || ny < 0 || nx >= n || ny >= n {
            continue
        }
        
        if visited[nx][ny] {
            continue
        }
        
        if board[nx][ny] == "1" {
            count += dfs(nx, ny)
        }
        
    }
    
    
    return count
}

for x in 0..<n {
    for y in 0..<n {
        
        if visited[x][y] == true {
            continue
        }
        
        if board[x][y] == "1" {
            result.append(dfs(x,y))
        }
        
        
        
    }
}

print(result.count)

result.sort()

for i in 0..<result.count {
    print(result[i])
}
