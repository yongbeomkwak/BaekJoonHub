var board : [Int:(Int,Int)] = [:]

var isOpen = Array(repeating:[false,false,false,false,false],count: 5)

for i in 0..<5 {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 0..<5 {
        board[input[j]] = (i,j)
    }
    
}

func diagonalLeftToRight() -> Bool {
    
    return isOpen[0][0] == true && isOpen[0][0] == isOpen[1][1] && isOpen[0][0] == isOpen[2][2] && isOpen[0][0] == isOpen[3][3] && isOpen[0][0] == isOpen[4][4]
}

func diagonaRightToLeft() -> Bool {
    
    return isOpen[0][4] == true && isOpen[0][4] == isOpen[1][3] && isOpen[0][4] == isOpen[2][2] && isOpen[0][4] == isOpen[3][1] && isOpen[0][4] == isOpen[4][0]
    
}

func horizon(_ r: Int) -> Bool {
    
    
    for i in 0..<5 {
        if isOpen[r][i] == false {
            return false
        }
    }
    
    return true
}

func vertical(_ c: Int) -> Bool {
    
    
    for i in 0..<5 {
        if isOpen[i][c] == false {
            return false
        }
    }
    
    return true
}

var count: Int = 1
var bingo: Set<[[Int]]> = .init()

var isBingo = false

for i in 0..<5 {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 0..<5 {
        
        let curr = board[input[j]]!
        
        let (r,c) = (curr.0,curr.1)
        
        isOpen[r][c] = true
        
        
        if diagonalLeftToRight() {
            bingo.insert([[0,0],[1,1],[2,2],[3,3],[4,4]])
        }
        
        if diagonaRightToLeft() {
            bingo.insert([[0,4],[1,3],[2,2],[3,1],[4,0]])
        }
        
        if horizon(r) {
            bingo.insert([[r,0],[r,1],[r,2],[r,3],[r,4]])
        }
        
        if vertical(c) {
            bingo.insert([[0,c],[1,c],[2,c],[3,c],[4,c]])
        }
        
        if bingo.count >= 3 {
            isBingo = true
            break
        }
        
        
        count += 1
    }
    
    if isBingo {
        break
    }
    
    
}

print(count)
