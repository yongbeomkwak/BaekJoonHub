import Foundation

var answer: [Int] = []



func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    var visited: [Bool] = [Bool](repeating: false, count:info.count)
    

    func dfs(_ sheeps: Int,_ wolves: Int) {
        
        if sheeps > wolves {
            answer.append(sheeps)
        }  else {
            return 
        }

        for edge in edges {
            
            let parent = edge[0]  
            let child = edge[1]
            
            if visited[parent] && !visited[child] {
                visited[child] = true
                if info[child] == 0 {
                    dfs(sheeps+1,wolves)
                } else {
                    dfs(sheeps,wolves+1)
                }
                 visited[child] = false 
            }
            
        }
        

    }
    
    visited[0] = true 
    dfs(1,0)
    
    return answer.max()!
}