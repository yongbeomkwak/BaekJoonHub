import Foundation

func input() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

enum Dir: String {
    case n = "N"
    case e = "E"
    case s = "S"
    case w = "W"
    
    
    var move: (Int,Int) {
        
        switch self {
            
        case .n:
            return (1,0)
        case .e:
            return (0,1)
        case .s:
            return (-1,0)
        case .w:
            return (0,-1)
        }
        
    }
    
    var rotationR: Dir {
        switch self {
            
        case .n:
            return .e
        case .e:
            return .s
        case .s:
            return .w
        case .w:
            return .n
        }
    }
    
    var rotationL: Dir {
        switch self {
            
        case .n:
            return .w
        case .e:
            return .n
        case .s:
            return .e
        case .w:
            return .s
        }
    }
    
}

let ab = input()

let (a,b) = (ab[0],ab[1]) // 가로, 세로
let nm = input()

let (n,m) = (nm[0],nm[1]) // 로봇 개수, 로봇 명령 개수

var board: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: a), count: b)

var robots: [(Int,Int)] = []
var dirs: [Dir] = []

for i in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{String($0)}
    
    let x = Int(input[0])!-1
    let y = Int(input[1])!-1
    let dir = Dir(rawValue:input[2])!
    
    robots.append((y, x))
    dirs.append(dir)
    board[y][x] = i+1
    
}

var crash: [String] = []

for _ in 0..<m {
    let input = readLine()!.split{$0 == " "}.map{String($0)}
    let number = Int(input[0])!
    let order = input[1]
    let count = Int(input[2])!
    
    if !crash.isEmpty {
        continue
    }
    
    if order == "F" {

        let move = dirs[number-1].move
        
        for _ in 0..<count {
            let currPos = robots[number-1]
            let nextPos = (currPos.0 + move.0, currPos.1 + move.1 )
            
            
            
            board[currPos.0][currPos.1] = 0
            if nextPos.0 < 0 || nextPos.0 >= b  || nextPos.1 < 0 || nextPos.1 >= a {
                crash.append("Robot \(number) crashes into the wall")
                break
            }
            
            if board[nextPos.0][nextPos.1] != 0 {
                crash.append("Robot \(number) crashes into robot \(board[nextPos.0][nextPos.1])")
            }
            
            robots[number-1] = nextPos
            board[nextPos.0][nextPos.1] = number

            
        }
        
        
        
        
    } else {
        
        for _ in 0..<count {
            let currDir = dirs[number-1]
            dirs[number-1] = order == "L" ? currDir.rotationL : currDir.rotationR
        }
        
    }

    
}

if crash.isEmpty {
    print("OK")
} else {
    print(crash.first!)
}
