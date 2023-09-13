import Foundation


extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}

struct Deque<T> {
    private var enqueue: [T]
    private var dequeue: [T] = []
    
    public var count: Int {
        return enqueue.count + dequeue.count
    }
    public var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    public var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    mutating func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    mutating func pushLast(_ n: T) {
        enqueue.append(n)
    }
    mutating func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
        
    }
    mutating func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let dx:[Int] = [0,0,1,-1]
let dy:[Int] = [1,-1,0,0]

func bfs(_ x:Int , _ y:Int,_ s:[String]) -> Bool {
    
    var visited:[[Bool]] = Array(repeating:[false,false,false,false,false,false],count:6)
    var dist:[[Int]] = Array(repeating:[0,0,0,0,0,0],count:6)
    
    var q = Deque([(x,y)])
    visited[x][y] = true
    
    var isBreakRule = false
    
    while !q.isEmpty {
        
        var p = q.popFirst()!
        
        let cx:Int = p.0
        let cy:Int = p.1
        
        for i in 0..<4 {
            let nx = cx + dx[i] , ny = cy + dy[i]
            
            if nx < 0 || ny < 0 || nx > 4 || ny > 4 {
                continue
            }
            
            if s[nx][ny] == "X" || visited[nx][ny] {
                continue
            }
            
            if s[nx][ny] == "P"{
                
                if dist[cx][cy] + 1 <= 2 {
                    isBreakRule = true 
                    break
                }
                
            }
            
            visited[nx][ny] = true 
            dist[nx][ny] = dist[cx][cy] + 1
            q.pushLast((nx,ny))
            
        }
        
        if isBreakRule {
            break
        }
        
    } 
    
    return isBreakRule
}

func solution(_ places:[[String]]) -> [Int] {
    
    var ans:[Int] = [0,0,0,0,0]
    
    for i in 0..<5 {
        var flag = false    
        for j in 0..<5 {
            
            for k in 0..<5 {
                 if places[i][j][k] == "P"{ // 사람이 앉아있으면 그 자리를 기준으로 맨해튼 거리 측정
                     flag = bfs(j,k,places[i])
                 }
                if flag {
                    break
                }
            }
            
            if  flag {
                 break
            }
        }
        
        ans[i] = flag ? 0 : 1
        
    }
    
    
    return ans
}