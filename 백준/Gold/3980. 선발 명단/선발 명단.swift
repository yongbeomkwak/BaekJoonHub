var tc = Int(readLine()!)!

repeat {
    
    var specs: [[Int]] = []
    
    for i in 0..<11 {
        specs.append(readLine()!.split{$0 == " "}.map{Int($0)!})
    }
    
    
    var result = Int.min
    
    var visit: [Bool] = [Bool](repeating: false, count: 11)
    
    func dfs(_ depth: Int, _ now:Int) {
        
        if depth == 11 {
            
            result = max(result,now)
            return
        }
        
        for i in 0..<11 {
            
            if specs[i][depth] == 0 {
                continue
            }
            
            
            if visit[i] == true {
                continue
            }
            
            visit[i] = true
            dfs(depth+1,now + specs[i][depth])
            visit[i] = false
            
        }
        
    }
    
    dfs(0,0)
    print(result)
    tc -= 1
    
} while tc > 0
