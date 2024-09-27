import Foundation

let MAX = 1000000

var adj: [[Int]] = Array(repeating: 
                         Array(repeating:MAX, count: 201),  
                           count:201)


func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    // a = a 도착지점 
    // b = b 도착지점
    // s = 출발지점
    
    for i in 1...n {
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
                if adj[i][j] > adj[i][k] + adj[k][j] {
                    adj[i][j] = adj[i][k] + adj[k][j]
                }
            }
        }
    }   
    
    var ans: Int = Int.max
    
    for mid in 1...n {
        ans = min(ans, adj[s][mid] + adj[mid][a] + adj[mid][b])
    }
    
    return ans
}