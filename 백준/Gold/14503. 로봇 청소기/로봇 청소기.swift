let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = []

enum Dir : Int {
    case North = 0
    case East = 1
    case South = 2
    case West = 3
    
    func move() -> [Int] {
        
        switch self {
            case .North:
                return [-1,0]
            case .East:
                return [0,1]
            case .West:
                return [0,-1]
            case .South:
                return [1,0]
        }
        
    }
    
    func rotate() -> Self {
        switch self {
            
        case .North:
            return .West
        case .East:
            return .North
        case .South:
            return .East
        case .West:
            return .South
        }
    }
    
    func back() -> [Int] {
        
        switch self {

        case .North:
            return [1,0]
        case .East:
            return [0,-1]
        case .South:
            return [-1,0]
        case .West:
            return [0,1]
        }
    }
}

// 0: 청소되지 않은
// 1: 청소됨

let info = readLine()!.split{$0 == " "}.map{Int($0)!}

var pos = (info[0],info[1],Dir(rawValue: info[2])!)

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var count: Int = 0

while true {
    
    let (x,y) = (pos.0,pos.1)
    if board[x][y] == 0 { // 현재 칸이 청소되지 않았다면
        board[x][y] = 2 // 청소
        count += 1
    }
    
    var allClear = true // 현재 기준 4칸 비교
    
    for i in 0..<4 {
        let (nx,ny) = (x+dx[i],y+dy[i])
        
        if board[nx][ny] == 0 { // 청소되지 않은 칸이 있으면
            allClear = false
            break
        }
        
    }
    
    if allClear { // 모두 클리어면 후진
        
        let back = pos.2.back()
        
        let (nx,ny) = (x+back[0],y+back[1])
        
        
        if board[nx][ny] == 1 {
            break
        }
        
        pos = (nx,ny,pos.2) // 뒤로 후진
        
        continue
        
    }  // 만약 청소되지 않은 곳이 있다면
    pos = (x,y,pos.2.rotate()) // 회전
    
    
    let front = pos.2.move()
    
    let (nx,ny) = (x+front[0],y+front[1])
    
    if nx < 0 || ny < 0 || nx >= n || ny >= m {
        continue
    }
    
    if board[nx][ny] == 0 { // 앞칸이 비어있으면
        pos = (nx,ny,pos.2) // 전진
    }
    
    
    
    
    
}

print(count)
