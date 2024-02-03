let rc = readLine()!.split{$0 == " "}.map{Int($0)!}

let (r,c) = (rc[0],rc[1])


let dx = [0,0,-1,1] , dy = [1,-1,0,0]

var board: [[Int]] = []

for _ in 0..<r {
    board.append(readLine()!.map { Int($0.asciiValue!) - 65 }) // A -> 0으로 매칭 Z -> 25
}

var ans = 0


func dfs(_ x:Int,_ y:Int,_ count:Int ,_ bit: Int) {
    
    ans = max(ans,count)
    
    for i in 0..<4 {
    
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= r || ny < 0 || ny >= c {
            continue
        }
        
        let next = 1 << board[nx][ny]
        
        if bit & next == 0 { // AND 연산 하고나서 0이면  아직 밞지 않은 것
            dfs(nx, ny, count+1, bit | next) // 밞은 결과를 넘겨준다
        }
        
        
    }
}

dfs(0,0,1,1<<board[0][0]) // x:0 , y:0 , count: 1 , bit = 처음꺼를 밞은채로 시작

print(ans)



