import Foundation



func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var board: [[Int]] = [[Int]](repeating:[Int](repeating:0,count:columns),count:rows)
    var k = 1 
    
    for i in 0..<rows { // board 초기화    
        for j in 0..<columns {
            board[i][j] = k
            k+=1
        }
    }

    
    func rotate(_ r1:Int,_ r2: Int,_ c1: Int, _ c2:Int) -> Int {
        
        var r = r1-1
        var c = c1-1

        var now = board[r][c]
        var minValue = now 
        // 왼쪽

        for c in c1..<c2 {

            minValue = min(minValue,board[r][c])

            (now,board[r][c]) = (board[r][c],now) // swap
        }
        
        c = c2-1 // 오른쪽 끝 
        
        for r in r1..<r2 {
            minValue = min(minValue,board[r][c])
            
            (now,board[r][c]) = (board[r][c],now) // swap
        }
        
        r = r2-1 // 아래
        
        for c in stride(from:c2-2,to:c1-2,by:-1) {
            minValue = min(minValue,board[r][c])
            
            (now,board[r][c]) = (board[r][c],now) // swap
        }
        
        c = c1-1
        
        for r in stride(from:r2-2,to:r1-2,by:-1) {
            minValue = min(minValue,board[r][c])
            
            (now,board[r][c]) = (board[r][c],now) // swap
        }
    
        
        return minValue
        
    }
    
    var ans:[Int] = []
    
    for q in queries {
        let x1 = q[0]
        let y1 = q[1]
        let x2 = q[2]
        let y2 = q[3]
        
        ans.append(rotate(x1,x2,y1,y2))
    }
    
    return ans
}