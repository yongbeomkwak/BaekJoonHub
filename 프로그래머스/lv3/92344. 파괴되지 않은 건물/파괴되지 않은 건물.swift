import Foundation


func effect(_  skillBoard: inout [[Int]],_ skill:[Int]){
    
    let type = skill[0]
    let r1 = skill[1]
    let c1 = skill[2]
    let r2 = skill[3]
    let c2 = skill[4]
    let degree = type == 1 ? -skill[5] : skill[5]
    
    /*
    +n ....   -n 
    
    
    
    -n ....   +n
    */
    
    skillBoard[r1][c1] += degree  // 행 시작      
    skillBoard[r2+1][c2+1] += degree //
    skillBoard[r1][c2+1] -= degree // 열 끝 
    skillBoard[r2+1][c1] -= degree // 행 끝 
}

func prefixSum(_ skillBoard: inout [[Int]]) {
    
    let cn:Int = skillBoard[0].count
    let rn:Int = skillBoard.count
    
    
    for i in 0..<rn {
        for j in 1..<cn {  // 열 누적합
            skillBoard[i][j] += skillBoard[i][j-1]
        }
    }
    
     for i in 1..<rn {
        for j in 0..<cn { // 행 누적합 
            skillBoard[i][j] += skillBoard[i-1][j]
        }
    }
    
}

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    var board = board
        var skillBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)
    
    
    for sk in skill {
        effect(&skillBoard,sk)
    }
    
    prefixSum(&skillBoard) // 누적합
    
    //스킬 데미지 보드에 적용
    var result = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            board[i][j] += skillBoard[i][j]
            if board[i][j] > 0 {
                result += 1
            }
        }
    }
    
    
    return result
}