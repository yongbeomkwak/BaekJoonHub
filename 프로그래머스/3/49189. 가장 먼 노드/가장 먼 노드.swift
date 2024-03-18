import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph: [[Int]] = [[Int]](repeating:[],count:n+1)
    
    for e in edge {
        
        let a = e[0]
        let b = e[1]
        
        graph[a].append(b)
        graph[b].append(a)
        
    }
    
    var dist: [Int] = [Int](repeating:1000000,count:n+1)
    
    var queue: [Int] = []
    
    queue.append(1)
    dist[0] = -1
    dist[1] = 0 
    
    var index:Int = 0 
    
    var result = 0
    
    while index < queue.count {
        let now = queue[index]
        
        for next in graph[now] {
            
            if dist[next] > dist[now] + 1 {
                dist[next] = dist[now]+1
                queue.append(next)
                
                result = max(result,dist[next])
                
            }
            
        }
        
        index += 1 
    }
    
    print(dist)
    
    
    
    return dist.filter{$0 == result}.count
}