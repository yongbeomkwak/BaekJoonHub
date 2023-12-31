import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    // 0 = 양 , 1 = 늑대
    
    var visited: [Bool] = [Bool](repeating:false,count:info.count)
    var maxCnt: Int = 1 
    
    
    func dfs(_ sheep:Int, _ wolf: Int) {
    
        if sheep > wolf {
            maxCnt = max(maxCnt,sheep)
        } else {
            return 
        }
        
        
         // 모든 간선을 순회하면서
        for edge in edges {
            let parent = edge[0], child = edge[1]
            // 부모는 방문했고 자식은 방문하지 않은 edge를 찾는다.
                // 부모는 이미 방문했으므로 현재 node에서 갈 수 있다. (돌아서라도)
            if visited[parent] && !visited[child] {
                visited[child] = true
                if info[child] == 0 {
                    dfs(sheep + 1,wolf)
                } else {
                    dfs(sheep, wolf + 1)
                }
                visited[child] = false
            }
        }
        
    }
    
    visited[0] = true 
    dfs(1,0)
    
    return maxCnt
}