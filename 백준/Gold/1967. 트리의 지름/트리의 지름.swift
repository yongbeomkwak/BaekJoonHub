import Foundation

let n = Int(readLine()!)!


var graph:Array<[(Int,Int)]> = Array<[(Int,Int)]>(repeating: [], count: n+1)

var dist = Array(repeating: -1, count: n+1)

for _ in 0..<n-1 {
    let info = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
    
    graph[info[0]].append((info[1],info[2]))
    graph[info[1]].append((info[0],info[2]))
}


func dfs(_ now:Int,_ cost:Int) {

    for info in graph[now]{
        if dist[info.0] == -1
        {
            dist[info.0] = cost + info.1
            dfs(info.0,dist[info.0]) // 자식노드 , 누적 cost + 현재 가중치
        }
        
        
    }
}

dist[1] = 0
dfs(1,0)

let dot1:Int =  dist.distance(from: 0, to: dist.firstIndex(of: dist.max()!)!)

dist = Array(repeating: -1, count: n+1)

dist[dot1] = 0
dfs(dot1,0)



print(dist.max()!)


