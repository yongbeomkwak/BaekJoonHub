import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    let maxFare = 200 * 100000
    var graph = [[Int]](repeating: [Int](repeating: maxFare, count: n + 1), count: n + 1)
    var answer = Int.max
    
    for f in fares {
        
        let from = f[0]
        let to = f[1]
        let cost = f[2]
        
        graph[from][to] = cost
        graph[to][from] = cost 
        
    }
    
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                
                if i == j {
                    graph[i][j] = 0
                    continue
                }
                
                if graph[i][j] > graph[i][k] + graph[k][j] {
                    graph[i][j] = graph[i][k] + graph[k][j]
                }
            }
        }
    }
    
    // 중간지점을 하나씩 설정하여 최솟값을 구함. 출발지에서 각자 출발하는 경우도 포함 (mid == s)
    for mid in 1...n {
        answer = min(answer, graph[s][mid] + graph[mid][a] + graph[mid][b])
    }

    return answer
    
    return 0
}