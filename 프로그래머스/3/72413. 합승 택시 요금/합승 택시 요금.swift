import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    let max = 2000000
    
    var adj:[[Int]] = [[Int]](repeating:[Int](repeating:max,count:n+1),count: n+1)
    
    for i in 0...n {
        adj[i][i] = 0
    }
    
    for fare in fares {
        
        let c = fare[0]
        let d = fare[1]
        let f = fare[2]
        adj[c][d] = f
        adj[d][c] = f 
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                adj[i][j] = min(adj[i][j],adj[i][k]+adj[k][j])
            }
        }
    }
    
  
    var cost = Int.max
    for i in 1...n {
        cost = min(cost,adj[s][i]+adj[i][a]+adj[i][b]) // i까지 가고 따로 가는거
    }
    
    return min(cost,adj[s][a]+adj[s][b]) // 출발 지점에서 아예 따로 출발
}