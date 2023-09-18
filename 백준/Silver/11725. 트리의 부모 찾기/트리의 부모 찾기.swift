import Foundation


let n = Int(readLine()!)!


var adj = [[Int]](repeating:[],count:n+1)


for _  in 0..<n-1 {
    
    let nodes = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    
    adj[nodes[0]].append(nodes[1])
    adj[nodes[1]].append(nodes[0])
    
}

var roots:[Int] = Array(repeating:-1,count: n+1)

func dfs(_ node:Int = 1) {
    
    
    for next in adj[node] {
        
        if roots[next] == -1 {
            roots[next] = node
            dfs(next)
        }
    }
    
    
}

dfs()


for i in 2...n {
    print(roots[i])
}
