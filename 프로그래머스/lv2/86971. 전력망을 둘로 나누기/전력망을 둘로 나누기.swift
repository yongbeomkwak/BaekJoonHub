import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    
    var graph:[[Int]] = [[Int]](repeating:[],count:n+1)
    var visited:[Bool] = [Bool](repeating:false,count:n+1)
    
    func dfs(_ curr:Int) -> Int {
        var ret:Int = 1
        
        if visited[curr] {
            return 0
        }
        
        visited[curr] = true
        
        
        for nxt in graph[curr]{
         
            ret += dfs(nxt)  
            
        }
        
        
        return ret // 총 연결된 전선들(누적)
    }
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    // 1을 기준으로 나눴을 때
    visited[1] = true 
    
    var count:Int = dfs(2)
    
    var result = abs(count - (n - count)) // 개수를 센 값 - (개수를 세지 않음 값) = 두 전력망 개수 차이
    
    
    
    for mid in 2...n { // 1을 기준으로 나눴을 때는 위에서 했으므로 2부터 시작 
        visited = [Bool](repeating:false,count:n+1)
        
        visited[mid] = true // 현재 지점을 기준으로 짜를꺼임 , 그래서 mid는 방문한걸로 취급

        count = dfs(1) // 항상 1부터 들어감
        
        result = min(result,abs(count - (n - count)))
    }
    

    
    
    return result
}