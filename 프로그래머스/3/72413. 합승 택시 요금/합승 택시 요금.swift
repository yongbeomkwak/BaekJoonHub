import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    var graph:[[Int]] = [[Int]](repeating:[Int](repeating:20000000,count:n+1),count:n+1)
    
    for fare in fares {
        
        let c = fare[0]
        let d = fare[1]
        let f = fare[2]
        
        graph[c][d] = f
        graph[d][c] = f
    }
    
    
    // 플로이드 와샬
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                
                if graph[i][j] > graph[i][k] + graph[k][j] {
                    graph[i][j] = graph[i][k] + graph[k][j]
                }
                
            }
        }
    }
    
    var viaWay = min(graph[s][b] + graph[b][a], graph[s][a] + graph[a][b] ) // 첫 출발은 , 바로 a 또는 b 집에 간다음 남은 사람 집감 (다른 지점 경유 x) 
    
    for i in 1...n {
        viaWay = min(viaWay,graph[s][i] + graph[i][a] + graph[i][b]) // 이후 모든 경유지 이후 그 경유지에서 각자 감
    }
    
    return min(graph[s][a] + graph[s][b],viaWay) // 마지막으로 출발지부터 따로 가는 경우랑 비교 
}