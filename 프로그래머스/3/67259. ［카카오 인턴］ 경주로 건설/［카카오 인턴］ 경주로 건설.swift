import Foundation

struct Queue<T> {
    
    var enque:[T] = []
    var deque:[T] = []
    
    var front: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return deque.last
        
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty 
    }
    
    mutating func push(_ element:T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
        
    }
    
}

enum DIR: Int {
    
    case u = 0 
    case d = 1
    case l = 2
    case r = 3
    
    
    func isCorner(_ dir:Self) -> Bool {
        
        switch self {
            
            case .u,.d: 
                return dir == .l || dir == .r
            
            
            case .l,.r:
                return dir == .d || dir == .u
            
        }
    
    }
}

struct Info {
    
    let x: Int
    let y: Int
    let dir: DIR 
    
    init(_ x:Int,_ y:Int,_ dir:DIR){
        self.x = x
        self.y = y
        self.dir = dir
    }
}

func solution(_ board:[[Int]]) -> Int {
    
    let n = board.count 
    
    var dist: [[[Int]]] = [[[Int]]](repeating:[[Int]](repeating:[Int.max,Int.max,Int.max,Int.max],count:n),count:n)
    
    var q = Queue<Info>()
    
    let dx: [Int] = [1,-1,0,0] // 상 하 좌 우   
    let dy: [Int] = [0,0,-1,1]
    
    dist[0][0][0] = 0
    dist[0][0][1] = 0
    dist[0][0][2] = 0
    dist[0][0][3] = 0
    q.push(Info(0,0,.d))
    q.push(Info(0,0,.r))

    while !q.isEmpty {
        
        let front = q.pop()!
        
        
        for i in 0..<4 {
            
            let nx = front.x + dx[i]
            let ny = front.y + dy[i]
            let nextDir = DIR(rawValue:i)!
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue 
            }
            
            if board[nx][ny] == 1 { // 다음이 벽
                continue
            }
            
            let cost = dist[front.x][front.y][front.dir.rawValue]
            var nextCost = cost+100 // 일단 직진
            
            
            if front.dir.isCorner(nextDir) {
                nextCost += 500 
            }
            
            
            if dist[nx][ny][nextDir.rawValue] > nextCost { // 최솟값 갱신 
                dist[nx][ny][nextDir.rawValue] = nextCost
                q.push(Info(nx,ny,nextDir))
            }

            
        }
        
    }
    

    return dist[n-1][n-1].min()! // 4방향 중 최솟값
}