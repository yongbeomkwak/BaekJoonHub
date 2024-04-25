import Foundation

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var tc = Int(readLine()!)!

repeat {
    
    let mnk = readLine()!.split{$0 == " "}.map{ Int($0)! }
    
    let (m,n,k) = (mnk[0],mnk[1],mnk[2])
    
    var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n )
    
    var cabbages: [(Int,Int)] = []
    
    for _ in 0..<k {
        let input = readLine()!.split{$0 == " "}.map{ Int($0)! }
        board[input[1]][input[0]] = 1
        cabbages.append((input[1],input[0]))
    }
    
    var count: Int = 0
    
  
    
    while !cabbages.isEmpty {
        
        let coor = cabbages.popLast()!
        
        if board[coor.0][coor.1] == 2 {
            continue
        }
        
        count += 1
        
        var queue: [(Int,Int)] = []
        var index: Int = 0
        
        board[coor.0][coor.1] = 2
        
        queue.append(coor)
        
        while index < queue.count {
            
            let front = queue[index]
            let (x,y) = front
            
            
            for i in 0..<4 {
                
                let (nx,ny) = (x+dx[i],y+dy[i])
                
                if nx < 0 || nx >= n || ny < 0 || ny >= m {
                    continue
                }
                
                if board[nx][ny] == 0 || board[nx][ny] == 2 {
                    continue
                }
                
                board[nx][ny] = 2
                queue.append((nx,ny))
                
            }
            
            index += 1
            
        }
        
        
    }
    
    
    
    print(count)
    
    
    tc -= 1
} while tc > 0
