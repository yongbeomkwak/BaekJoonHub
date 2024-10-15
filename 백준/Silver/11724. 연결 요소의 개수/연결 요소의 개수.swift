import Foundation

let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n, m) = (nm[0], nm[1])

var adj: [[Int]] = [[Int]](repeating: [], count: n+1)

for _ in 0..<m {
    let ab = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (a,b) = (ab[0], ab[1])
    adj[a].append(b)
    adj[b].append(a)
}

var visited: [Bool] = [Bool](repeating: false, count: n+1)


func dfs(_ now: Int) {
     visited[now] = true
    
    for next in adj[now]{
        if visited[next] {
            continue
        }
        dfs(next)
    }
    
}

var ans: Int = 0

for root in 1...n {
    if !visited[root] {
        dfs(root)
        ans += 1
    }
}

print(ans)

