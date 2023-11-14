import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    var visited: [Bool] = [Bool](repeating:false, count: info.count)
    
    
    visited[0] = true
    var answer = 0
    
    func dfs(_ sheep: Int, _ wolf: Int) {
        
        if sheep <= wolf {
            return 
        } else {
            answer = answer < sheep ? sheep : answer 
        }
        
        
        for edge in edges {
            
            let parent = edge[0]
            let child = edge[1]
            
            if visited[parent] , !visited[child] { // 부모는 방문했고,  자식 아직 방문 안했으면 탐색 가능성 o
                
                visited[child] = true
                if info[child] == 0 {
                    dfs(sheep+1,wolf)
                }
                
                else {
                    dfs(sheep,wolf+1)
                }
                
                visited[child] = false
                
            }
            
        }
        
    }
    
    dfs(1,0)
    
    return answer
}