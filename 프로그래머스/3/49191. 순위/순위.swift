import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var adj:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for result in results {
        
        let u = result[0]
        let v = result[1]
        
        adj[u][v] = 1
        
    }
    
    var count:Int = 0
    
    for k in 1...n {
        
        for i in 1...n {
            
            for j in 1...n {
                
                if (adj[i][k] == 1 &&  adj[k][j] == 1) {
                    
                    adj[i][j] = 1
                }
                
                
            }
            
        }
        
    }
    
    print(adj)
    
    for i in 1...n {
        
        var cnt:Int = 0
        
        for j in 1...n {
            if adj[i][j] == 1 || adj[j][i] == 1 {
                cnt += 1
            }
        }
        
        if cnt == n-1 {
            count += 1
        }
        

    }
    
    return count
}