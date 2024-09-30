import Foundation

enum Dir : String {
    case d
    case l
    case r
    case u

    
    init(n: Int) {
        
        switch n {
            case 0:
            self = .l
            case 1:
            self = .r
            case 2:
            self = .u
        default:
            self = .d
        }
    }
    
    var coord: (Int, Int) {
        switch self {
            
        case .l:
            return (0, -1)
        case .r:
            return (0, 1)
        case .u:
            return (-1, 0)
        case .d:
            return (1, 0)
        }
    }
    
}

let dirs: [Dir] = [.d, .l, .r, .u]

func minDist(_ x1: Int, _ y1: Int, _ x2: Int,_ y2: Int) -> Int {
    return abs(x1-x2) + abs(y1-y2)
} 

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    // n = 세로 길이
    // m = rkfh rlfdl
    // x = 초기 세로
    // y = 초기 가로
    // r = 도착 세로
    // c = 도착 가로
    // k = 제한

    var ans: String = ""
        
    func dfs(_ x:Int, _ y: Int, _ dist: Int, _ record:[String]) {
        
        if  k < (dist + minDist(x,y,r,c)) { // 남은 횟수안에 도착 X
            return 
        }
        
        if dist == k && ( x ==  r && y == c ) { 
            ans = record.joined()
            return
        }
        
        for i in 0..<4 {
            
            let dir = dirs[i]
            let (dx, dy) = dir.coord
            
            let nextX = x + dx
            let nextY = y + dy
        
            if  !(1...n ~= nextX) || !(1...m ~= nextY) || !ans.isEmpty { 
                continue
            }
            
            
            dfs(nextX,nextY,dist+1,record + [dir.rawValue])
            
        }
        
       
    }
    
    if  (k < minDist(x,y,r,c)) || (k-minDist(x,y,r,c)) % 2 != 0   { 
        // 맨해튼 거리보다 짧거나 , 그 차이가 홀 수이면 도착 불가 
        return "impossible"
    }
    
    dfs(x,y,0,[])
    
    
    return ans
}
