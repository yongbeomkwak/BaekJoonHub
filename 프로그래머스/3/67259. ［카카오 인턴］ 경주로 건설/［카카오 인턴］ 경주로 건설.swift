import Foundation

struct Queue<T> {
    
    var enque: [T]
    
    var deque: [T] = []
    
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty 
    }
    
    
    var front: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return deque.last 
        
    }
    
    mutating func push(_ element: T){
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.removeLast()
        
    }
}

enum Dir:Int {
    case `none` = -1
    case top = 0
    case bottom = 1
    case left = 2
    case right = 3
}

struct Point {
    let x:Int
    let y:Int 
    let cost:Int
    let dir:Dir
    
    init (_ x:Int, _ y:Int, _ cost:Int, _ dir:Dir){
        self.x = x
        self.y = y
        self.cost = cost
        self.dir = dir
    }
}


let dx:[Int] = [-1,1,0,0] // 상,하,좌,우 
let dy:[Int] = [0,0,-1,1]

func solution(_ board:[[Int]]) -> Int {
    
    //직선 도로 100 , 코너 (500+100)
    let n = board.count
    var dist:[[[Int]]] = [[[Int]]](repeating:[[Int]](repeating: [Int](repeating:Int.max,count: 4),count: n),count: n)
    
    dist[0][0][0] = 0 // left
    dist[0][0][1] = 0 // right
    dist[0][0][2] = 0 // top
    dist[0][0][3] = 0 // bottom
    
    var q = Queue<Point>([])
    
    q.push(Point(0,0,0,.none))
    
    while !q.isEmpty {
        
        let now = q.pop()!
        
        
        for i in 0..<4 { // 상하좌우
            
           let nx = now.x + dx[i]
            let ny = now.y + dy[i]
            let nextDir: Dir = Dir(rawValue:i)!
            var nextCost = now.cost+100
            
            if (nx<0 || nx>=n) || (ny<0 || ny>=n) { 
                continue 
            }
            
            if board[nx][ny] == 1{ // 벽
                continue
            }
            
            if  (now.dir == .left || now.dir == .right) && (nextDir == .top || nextDir == .bottom) { //현재는 수평인데, 다음이 수직 이면 코너 
                nextCost+=500
            }
            
            if (now.dir == .top || now.dir == .bottom) && (nextDir == .left || nextDir == .right) { //현재는 수직인데, 다음이 수평 이면 코너 
                nextCost+=500
            }
            
            if dist[nx][ny][i] > nextCost {
                
                dist[nx][ny][i] = nextCost
                q.push(Point(nx,ny,nextCost,nextDir))
                
            } 
            

        }
        
    }
    
    return dist[n-1][n-1].min()!
}