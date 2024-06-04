import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let n = Int(readLine()!)!

var board: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)

for _ in 0..<n {
    let x = input()
    let(w,h) = (x[0],x[1])
    
    for i in h..<h+10 {
        for j in w..<w+10 {
            board[i][j] = true
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var ans: Int = 0

for x in 1..<101 {
    for y in 1..<101 {
 
        var tmp = 0
        
        if board[x][y] == false {
            continue
        }
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if board[nx][ny] {
                tmp += 1
            }
            
        }
        
        if tmp == 3 {
            ans += 1
        } else if tmp == 2 {
            ans += 2
        }
    }
}

print(ans)
