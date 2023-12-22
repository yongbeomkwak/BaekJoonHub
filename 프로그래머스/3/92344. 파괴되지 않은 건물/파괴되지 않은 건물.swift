import Foundation

func effect(_ skill:[Int],_ acc: inout [[Int]] ) {
    
    let r1 = skill[1]
    let r2 = skill[3]+1
    let c1 = skill[2]
    let c2 = skill[4]+1
    
    
    let d = skill[0] == 1 ? -skill[5] : skill[5] 
    
    
    acc[r1][c1] += d 
    acc[r1][c2] -= d
    acc[r2][c1] -= d
    acc[r2][c2] += d 
    
    
}

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {

    var board = board 
    let n = board.count
    let m = board[0].count
    var acc = [[Int]](repeating:[Int](repeating:0,count:m+1),count:n+1)
    
    
    for sk in skill {
        effect(sk,&acc)
    }

    
    for r in 0..<n {
        for c in 1...m {
            acc[r][c] += acc[r][c-1]
        } 
    }
    //가로 누적합
    
    for c in 0..<m {
        for r in 1...n {
            
            acc[r][c] += acc[r-1][c]
        }
    }
    
    //세로 누적합
    
    var result: Int = 0
    
    for r in 0..<n {
        for c in 0..<m {
        
            if board[r][c] + acc[r][c] > 0 { 
                result += 1
            }
            
        }
    }
    
    
    return result
    

}