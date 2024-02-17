
struct Queue<T> {
    
    var enque:[T]
    
    var deque:[T] = []
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    
    var front:T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return enque.last
        
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
        
    }
    
    mutating func push(_ element:T) {
        
        enque.append(element)
    }
    
}




var puzzle: String = ""

for _ in 0..<3 {
    puzzle += readLine()!.split{$0 == " "}.map{String($0)}.joined()
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var visited: [String : Int] = [puzzle:0]


func bfs () -> Int {
    
    var q = Queue<String>([puzzle])
    
    while !q.isEmpty {
        
        var curr = q.pop()!
        var cnt = visited[curr]!
        
        if curr == "123456780" {
            return cnt
        }
        
        
        
        let z = Array(curr).firstIndex(of: "0")!
        
        let x = z/3
        let y = z%3
        
        
        cnt += 1
        for i in 0..<4 {
            
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx > 2 || ny < 0 || ny > 2 {
                continue
            }
            
            let nz = nx*3 + ny
            var puzzleList  = Array(curr)
            
            puzzleList.swapAt(z, nz) // 변경
            
            let newPuzzle = puzzleList.reduce("", {$0 + String($1)})
            
            if visited[newPuzzle,default: 0] == 0 {
                q.push(newPuzzle)
                visited[newPuzzle] = cnt
            }
            
        }
        
    }
    
    
    return -1
}

print(bfs())
