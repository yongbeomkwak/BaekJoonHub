import Foundation

let nmk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,k) = (nmk[0],nmk[1],nmk[2])

var board: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

var stk: [(Int,Int)] = []

for _ in 0..<k  {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    board[input[0]-1][input[1]-1] = 1
    stk.append((input[0]-1,input[1]-1))
}

var result = 0

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

while !stk.isEmpty {
    let (a,b) = stk.popLast()!
    var queue: [(Int,Int)] = []
    var index: Int = 0
    board[a][b] = 2
    queue.append((a,b))
    
    while index < queue.count {
        let (x,y) = queue[index]
        
        
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                continue
            }
            
            if board[nx][ny] == 1 {
                board[nx][ny] = 2
                queue.append((nx,ny))
            }
            
        }
        
        
        index += 1
    }
    
    result = max(result,queue.count)
    
}

print(result)
