let nlr = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,l,r) = (nlr[0],nlr[1],nlr[2])

var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

struct Node {
    let x,y : Int
    
    init(_ x:Int,_ y:Int) {
        self.x = x
        self.y = y
    }
}

var visited:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

let dy = [0,0,-1,1]
let dx = [1,-1,0,0]

func openBorderLine(_ x: Int,_ y: Int) -> ([Node],Int) {
    
    var queue: [Node] = []
    var result: [Node] = []
    var index: Int = 0
    
    queue.append(Node(x,y))
    
    while index < queue.count {
        
        let (x,y) = (queue[index].x, queue[index].y)
        
        for i in 0..<4{
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n {
                continue
            }
            
            if visited[nx][ny] == true {
                continue
            }
        
            if  l...r ~= abs(board[x][y] - board[nx][ny]) {
                visited[x][y] = true
                visited[nx][ny] = true
                queue.append(Node(nx,ny))
                result.append(Node(nx,ny))
            }
            
        }
        
        index += 1
    }
    
    if !result.isEmpty {
        result.append(Node(x,y))
    }
    
    
    return (result,getMovePopulation(result))
}

func getMovePopulation(_ arr:[Node]) -> Int { // 연합 인구

    if arr.count == 0 {
        return 0
    }
    
    return arr.reduce(0, {
        
        return $0 + board[$1.x][$1.y]
        
    })/arr.count
}

func closeBorderLine() { // 국경 닫기
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
}

var ans: Int = 0

while true {
    
    var united : [[Node]] = []
    var unitedPopulation : [Int] = []
    
    for i in 0..<n {
        for j in 0..<n {
            
            if visited[i][j] {
                continue
            }
            
            let (nodes,move) =  openBorderLine(i, j)
            
            if !nodes.isEmpty {
                united.append(nodes)
                unitedPopulation.append(move)
            }
            
        }
    }
    
    if united.isEmpty {
        break
    }
    
    
    // 인원 분배
    for (i,nodes) in united.enumerated() {
        for node in nodes {
            board[node.x][node.y] = unitedPopulation[i]
        }
    }
    
    // 국경 닫기
    closeBorderLine()
    
    ans += 1
    
}

print(ans)
