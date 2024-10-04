import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

let dy = [-1,1,0,0]
let dx = [0,0,-1,1]

var ans: Int =  1000_000

typealias Pos = (Int, Int) 


func solution(_ maps:[String]) -> Int {
    
    var entryPos: Pos = (0,0)
    var leverPos: Pos = (0,0)
    var exitPos: Pos = (0,0)
    let n = maps.count
    let m = maps[0].count
    var index: Int = 0 
    var queue: [Pos]  = [] 
    
    for i in 0..<n {
        for j in 0..<m {
            if maps[i][j] == "S" {
                entryPos = (i,j)
            } else if maps[i][j] == "L" {
                leverPos = (i,j)
            } else if maps[i][j] == "E" {
                exitPos = (i,j)
            }
        }
    }
    
    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count:m), count: n)
    
    visited[entryPos.0][entryPos.1] = 0 
    queue.append(entryPos)
    var leverMinTime = Int.max

    while index < queue.count {
        let pos = queue[index]
        let (x,y) = pos
        
        if pos == leverPos {
            leverMinTime = visited[x][y]           
            break
        } 
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n  || ny < 0 || ny >= m { continue }
            if maps[nx][ny] == "X" { continue }
            if visited[nx][ny] != -1 { continue }
            
            visited[nx][ny] = visited[x][y] + 1
            queue.append((nx,ny))
        }
        
        index += 1 
    }
    
    if visited[leverPos.0][leverPos.1] == -1 {
        return -1
    }
    
    visited = [[Int]](repeating: [Int](repeating: -1, count:m), count: n)
    queue.removeAll()
    queue.append(leverPos)
    visited[leverPos.0][leverPos.1] = leverMinTime 
    index = 0
    
    while index < queue.count {
        let pos = queue[index]
        let (x,y) = pos
        
        if pos == exitPos {
            break
        } 
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n  || ny < 0 || ny >= m { continue }
            if maps[nx][ny] == "X" { continue }
            if visited[nx][ny] != -1 { continue }
            
            visited[nx][ny] = visited[x][y] + 1
            queue.append((nx,ny))
        }
        
        index += 1 
    }
    
    
   
   return visited[exitPos.0][exitPos.1]
}