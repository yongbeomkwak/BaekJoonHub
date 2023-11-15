import Foundation

enum Dir: String {
    
    case left = "l"
    case right = "r"
    case up = "u"
    case down = "d"
    
}

func shift(_ dir: Dir) -> (Int,Int) {
    
    
    switch dir {
        case .left:
            return (0,-1)
        
        case .right:
            return (0,1)
        
        case .up:
            return (-1,0)
        
        case .down:
            return (1,0)
    }
    
}

func minDis(_ destX: Int, _ currX: Int, _ destY: Int, _ currY: Int) -> Int {
    
    
    return abs(destX-currX) + abs(destY-currY)
}


func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    
    var ans = ""
    
    let dir:[Dir] = [.down, .left, .right, .up,] // 알파벳 순을 위해
    
    /*
     n = 세로 길이
     m = 가로 길이 
     x = 출발 지점 세로 위치 
     y = 출발 지점 가로 위치
     r = 탈출 지점 세로 위치
     c = 탈출 지점 가로 위치
     k = 제한 거리
    */
    
    
    func dfs(_ nowX: Int, _ nowY: Int, _ dist:Int, _ s:String) {
        if  k < (dist + minDis(r,nowX,c,nowY)) { // 남은 횟수안에 도착 X
            return 
        }
        
        if dist == k && ( nowX ==  r && nowY == c ) { 
            ans = s
            return
        }
        
        for i in 0..<4 {
            
            let nextDir = dir[i]
            let (dx,dy) = shift(nextDir)
            
            let nextX = nowX + dx
            let nextY = nowY + dy
        
            if  !(1...n ~= nextX) || !(1...m ~= nextY) || !ans.isEmpty {
                continue
            }
            
            
            dfs(nextX,nextY,dist+1,s+nextDir.rawValue)
            
        }
        
    }
    
    
    if  (k < minDis(x,r,y,c)) || (k-minDis(x,r,y,c)) % 2 != 0   { // 맨해튼 거리보다 짧거나 , 그 차이가 홀 수이면 도착 불가 
        return "impossible"
    }
    
    dfs(x,y,0,"")
    
    return ans.isEmpty ? "impossible" : ans
}