let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = []

for _ in 0..<n{
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

func dfs(_ x:Int,_ y:Int) -> Int{
    
    if x == n-1 && y == m-1 {
        dp[x][y] = 1
        return 1
    }
    
    if dp[x][y] != -1 {
        return dp[x][y]
    }
    
    dp[x][y] = 0
    
    for i in 0..<4 {
        
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m {
            continue
        }
        
        if board[x][y] <= board[nx][ny] { // 내리 막길이 아님
            continue
        }
    
        dp[x][y] += dfs(nx,ny)
        
    }
    
    return dp[x][y]
}


print(dfs(0, 0))
