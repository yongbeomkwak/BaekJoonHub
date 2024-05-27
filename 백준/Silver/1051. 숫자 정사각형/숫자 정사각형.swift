import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nm = input()

let (n,m) = (nm[0],nm[1])

var board: [[Int]] = []

var result: Int = 1

for _ in 0..<n {
    board.append(Array(readLine()!).map{Int(String($0))!})
}

let limit = min(n,m)

func travel(_ x:Int,_ y:Int) {
    
    let target = board[x][y]
    
    
    for l in 1..<limit {
        let x2 = x+l
        let y2 = y+l
        
        if x2 >= n || y2 >= m {
            break
        }
        
        if target ==  board[x][y2] && target == board[x2][y] &&   target == board[x2][y2] {
            result = max(result,(l+1)*(l+1))
        }
        
    }
    
}

for i in 0..<n {
    for j in 0..<m {
    travel(i, j)
    }
}

print(result)
