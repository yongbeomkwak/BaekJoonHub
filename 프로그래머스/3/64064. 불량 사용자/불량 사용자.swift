import Foundation

extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}

func isVillain(_ s1: String, _ s2: String) -> Bool { // 불량 사용자인지 판단
    
    if s1.count != s2.count {
        return false 
    }
    
    
    for i in 0..<s1.count {
        
        if s1[i] == s2[i] || s2[i] == "*" {
            continue 
        }
        
        else {
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
            if isVillain(user,bid) { // 검거
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
}