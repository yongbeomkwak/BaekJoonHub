var tc = Int(readLine()!)!

repeat {
    
    var arr = Array(readLine()!)
    var result: [String] = []
    
    var visited:[Character:Int] = [:]
    
    for c in arr {
        visited[c,default: 0] += 1
    }
    
    func dfs(_ depth: Int,_ now: [Character]) {
        
        if depth == arr.count {
            result.append(String(now))
            return
        }
        
        
        for v in visited.keys {
            
            if visited[v,default: 0] != 0 {
                
                visited[v]! -= 1
                dfs(depth+1, now + [v])
                visited[v]! += 1
                
            }
            
        }
        
    }
    
    dfs(0, [])
    
    print(result.sorted().joined(separator: "\n"))
    
    tc -= 1
     
} while tc > 0
