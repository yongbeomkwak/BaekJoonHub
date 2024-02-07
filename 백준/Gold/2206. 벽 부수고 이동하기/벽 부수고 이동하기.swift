struct Queue<T> {
    
    var enque: [T]
    var deque: [T] = []
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty : Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var first: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        return deque.last
        
    }
    
    mutating func push(_ element: T) {
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

let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var map : [[Character]] = []

for _ in 0..<n{
    map.append(Array(readLine()!))
}

var q = Queue<(Int,Int,Int,Bool)>([]) // x y dist isCrashed

let MAX = Int.max-1
var visited: [[[Bool]]] = [[[Bool]]](repeating: [[Bool]](repeating: [false,false], count: m), count: n)



let dx : [Int] = [0,0,-1,1]
let dy : [Int] = [1,-1,0,0]

q.push((0, 0,1,false))
visited[0][0][0] = true
visited[0][0][1] = true  // [][][0] = 뿌순적 없음 [][][1] 뿌순적 있음

var result : Int = -1

while !q.isEmpty {
    
    let (nowX,nowY,dist,isCrashed) = q.pop()!
    
    
    if nowX == n-1 && nowY == m-1 {
        result = dist
        break
    }
    
    for i in 0..<4 {
        let nextX = nowX+dx[i]
        let nextY = nowY+dy[i]
        
        if nextX < 0 || nextY < 0 || nextX >= n || nextY >= m {
            continue
        }
        
        if map[nextX][nextY] == "1" && isCrashed { // 벽으로 막혀있는데, 이미 한번 부셨다? 넘어가
            continue
        }
        
        if visited[nextX][nextY][isCrashed ? 1 : 0] {
            continue
        }
        
        if map[nextX][nextY] == "1" { // 다음이 벽이고
            
            if isCrashed == false { // 이전에 벽을 뿌신 적 없으면
                
                visited[nextX][nextY][isCrashed ? 1 : 0] = true
                q.push((nextX, nextY,dist+1,true)) // 뿌셔(true)
            }
            
        } else {
            
            visited[nextX][nextY][isCrashed ? 1 : 0] = true
            q.push((nextX, nextY,dist+1,isCrashed))
        }
        
       
        

        
        
    }
    
}

print(result)
