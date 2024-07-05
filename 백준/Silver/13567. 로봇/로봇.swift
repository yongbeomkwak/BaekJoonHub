import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

enum Dir: Int {
    
    case e = 0
    case s
    case w
    case n
    
    
    func rotateL() -> Dir {
        
        switch self {
            
        case .e:
            return .n
        case .s:
            return .e
        case .w:
            return .s
        case .n:
            return .w
        }
        
    }
    
    func rotateR() -> Dir {
        
        switch self {
            
        case .e:
            return .s
        case .s:
            return .w
        case .w:
            return .n
        case .n:
            return .e
        }
    }
    
    
    func move(_ amount: Int) -> (Int,Int) {
        
        switch self {
            
        case .e:
            return (0, amount)
        case .s:
            return (-amount, 0)
        case .w:
            return (0,-amount)
        case .n:
            return (+amount, 0)
        }
        
        
    }
    
}

var pos: (Int, Int) = (0, 0)
var dir: Dir = .e

let mn = readIntArray()
let (m,n) = (mn[0], mn[1])

var flag = true

for _ in 0..<n {
    let command = readLine()!.split{$0 == " "}.map{String($0)}
    
    let d = Int(command[1])!
    
    if command[0] == "MOVE" {

        let dirMove = dir.move(d)
        let next = (pos.0 + dirMove.0, pos.1 + dirMove.1 )
                
        pos = next
        

        
    } else {
     
        if d == 0 {
            dir = dir.rotateL()
        } else {
            dir = dir.rotateR()
        }
        
    }
    
    if pos.0 < 0 || pos.0 > m || pos.1 < 0 || pos.1 > m { // 밖에 벗어나감
        flag = false
        break
    }
    
    
}

if flag == false {
    print(-1)
} else {
    print("\(pos.1) \(pos.0)")
}


