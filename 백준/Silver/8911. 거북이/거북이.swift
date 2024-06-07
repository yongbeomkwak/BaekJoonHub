import Foundation

func input() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

 var tc = Int(readLine()!)!

enum Dir {
    case up
    case right
    case down
    case left

    
    func rotateR() -> Self {
        
        switch self {
            
        case .up:
            return .right
        case .right:
            return .down
        case .down:
            return .left
        case .left:
            return .up
        }
        
    }
    
    
    func rotateL() -> Self {
        
        switch self {
            
        case .up:
            return .left
        case .right:
            return .up
        case .down:
            return .right
        case .left:
            return .down
        }
        
    }
    
    
    func moveFornt() -> (Int, Int) {
        
        switch self {
            
        case .up:
            return (1,0)
        case .right:
            return (0,1)
        case .down:
            return (-1,0)
        case .left:
            return (0,-1)
        }
        
    }
    
    func moveBack() -> (Int, Int) {
        
        switch self {
            
        case .up:
            return (-1,0)
        case .right:
            return (0,-1)
        case .down:
            return (1,0)
        case .left:
            return (0,1)
        }
        
    }
    
}

repeat {

    var topDist: Int = 0
    var bottomDist: Int = 0
    var leftDist: Int = 0
    var rightDist: Int = 0
    
    var pos = (0,0)
    
    var dir: Dir = .up
    
    let order = Array(readLine()!)
    
    for o in order {
        
        if o == "R" {
            dir = dir.rotateR()
        } else if o == "L" {
            dir = dir.rotateL()
        } else {
        
            let front = dir.moveFornt()
            let back = dir.moveBack()
            
            pos = o == "F" ? (pos.0 + front.0, pos.1 + front.1) : (pos.0 + back.0, pos.1 + back.1)
            
            topDist = max(topDist,pos.0)
            bottomDist = min(bottomDist,pos.0)
            leftDist = min(leftDist,pos.1)
            rightDist = max(rightDist,pos.1)
            
        }
        
    }
    
    let width = rightDist - leftDist
    let height = topDist - bottomDist
    
    
    print(width*height)
    
    tc -= 1
} while tc > 0
