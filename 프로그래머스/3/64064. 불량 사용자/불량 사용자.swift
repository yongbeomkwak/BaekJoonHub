import Foundation

func isBanned(_ user: String,_ pattern: String) -> Bool {
    
    if user.count != pattern.count {
        return false
    }
    
    
    for (u,p) in zip(user,pattern) {
        
        if p == "*" {
            continue
        }
        
        if u != p {
            return false 
        }
    }
    
    return true
}
 

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    
     let uCount = user_id.count
    let bCount = banned_id.count
    
    var visited: [Bool] = [Bool](repeating:false, count: uCount) // 탐색을 위한 방문여부 배열 
    var graph: [[Int]] = [[Int]](repeating:[], count: bCount) // [불량 패턴 index].append(불량 유저 후보)
    var `set`: Set<String> = .init()
    
    for (bIndex,bid) in banned_id.enumerated() {
        
        for (uIndex,user) in user_id.enumerated() {
            if isBanned(user,bid) { // 검거
                graph[bIndex].append(uIndex) // 불량 유저 추가 
            }
        }
    }

    
    var ans:[[String]] = []
    
  
    
    func dfs(_ index: Int,_ arr: [String]) {
        
        if index == bCount { // 모든 불량 패턴을 충족했다면
            
            let s = arr.sorted().joined() // 해당 조합을 정렬 후 
            
            if !set.contains(s) { // 셋에 있는지 여부 확인 , 있으면 이미 있는 패턴이므로 무시 
                set.insert(s) // 없으면 추가 
                ans.append(arr)
            }
            return
        }
        
        for next in graph[index] { // 완전 탐색 
            if !visited[next] {
                visited[next] = true
                dfs(index+1,arr + [user_id[next]])
                visited[next] = false
            }
        }
        
    }
    
    dfs(0,[])
    print(ans)
    
    return ans.count
    
    
    return 0
}