let scroll = Array(readLine()!)

let angel = Array(readLine()!)
let devel = Array(readLine()!)


let end = scroll.count

var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: 20), count: 100)

// dp[100][20][2] = 현재 밞은 곳 , 다음 밝은 곳 , 악마 인지 천사인지

func move(_ now:Int,_ depth: Int,_ turn:  Int) -> Int {
    
    if depth >= end {
        return 1 // 도착
    }
    
    if dp[now][depth][turn] != -1 {
        return dp[now][depth][turn]
    }
    
    var total: Int = 0
    
    if turn == 1 { // 현재 엔젤
        
        for i in now..<angel.count {
            
            if scroll[depth] == angel[i] {
                 total += move(i+1, depth+1, 0) // 다음은 악마
            }
            
        }
        
    } else {
        
        for i in now..<devel.count {
            
            if scroll[depth] == devel[i] {
                 total += move(i+1, depth+1, 1) // 다음은 엔젤
            }
            
        }
        
    }
    
    dp[now][depth][turn] = total
    
    return dp[now][depth][turn]
    
}

print(move(0, 0, 1)+move(0,0,0)) // 천사 시작 + 악마 시작
