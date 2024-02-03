struct Queue<T> {
    
    var enque: [T]
    var deque: [T] = []
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty : Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var front: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return deque.last
        
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



let rc = readLine()!.split{$0 == " "}.map{Int($0)!}

let r = rc[0] , c = rc[1]

var board:[[Character]] = []
var fireDist: [[Int]] = [[Int]](repeating:[Int](repeating: 1000000, count: c),count:r)
var jDist: [[Int]] = [[Int]](repeating:[Int](repeating: 1000000, count: c),count:r)

let dx : [Int] = [0,0,-1,1]
let dy : [Int] = [1,-1,0,0]

var fireQueue = Queue<(Int,Int)>([])
var jiQueue = Queue<(Int,Int)>([])

for i in 0..<r {
    let input = Array(readLine()!)
    board.append(input)
    
    for j in 0..<c {
        if input[j] == "J" {
            jDist[i][j] = 1
            jiQueue.push((i,j))
        }
        
        if input[j] == "F" {
            fireDist[i][j] = 1
            fireQueue.push((i, j))
        }
            
    }
    
}


func spreadFire() {
    

    
    
    while !fireQueue.isEmpty {
        let (x,y) = fireQueue.pop()!
        
        
        for i in 0..<4 {
            
            let nx = x+dx[i] , ny = y+dy[i]
            
            if nx < 0 || nx >= r || ny < 0 || ny >= c {
                continue
            }
            
            if board[nx][ny] == "#" { // 벽
                continue
            }
            
            if fireDist[nx][ny] > fireDist[x][y]+1 {
                fireDist[nx][ny] = fireDist[x][y]+1
                fireQueue.push((nx, ny))
            }
            
        }
    }
    
}


func runAway() -> Int {
    
    while !jiQueue.isEmpty {
        let (x,y) = jiQueue.pop()!
        
        
        for i in 0..<4 {
            
            let nx = x+dx[i] , ny = y+dy[i]
            
            if nx < 0 || nx >= r || ny < 0 || ny >= c { // 탈출
                return jDist[x][y]
            }
            
            if board[nx][ny] == "#" { // 벽
                continue
            }
            
            if jDist[x][y]+1 >= fireDist[nx][ny] { // 불이 먼저 도착하면
                continue
            }

            if  jDist[nx][ny] > jDist[x][y]+1  {
                jDist[nx][ny] = jDist[x][y]+1
                jiQueue.push((nx, ny))
            }
            
        }
    }
    return -1
}



spreadFire() // 불 먼저 퍼지고
let ans = runAway()


print(ans == -1 ? "IMPOSSIBLE" : ans)
