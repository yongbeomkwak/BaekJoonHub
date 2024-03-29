let n = Int(readLine()!)!
let MAX = 1000001

var adj: [[Int]] = [[Int]](repeating: [], count: n+1)


var dp: [[Int]] = [[Int]](repeating: [0,0], count: n+1) // dp[i][0] = i노드가 일반인일 때 , dp[i][1] = i가 어댑터가 일 때 ,최소 얼리 어답터 수



var visited:[Bool] = [Bool](repeating: false, count: n+1)

for _ in 0..<n-1 {
    
    let ab = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (a,b) = (ab[0],ab[1])
    
    adj[a].append(b)
    adj[b].append(a)

}

func dfs(_ x:Int) {
    
    visited[x] = true
    dp[x][1] = 1 // 어뎁터
    
    for next in adj[x] {
        
        if visited[next] {
            continue
        }
        
        dfs(next)
        
        //x가 일반인이면 next는 무조건 어댑터
        dp[x][0] += dp[next][1]
        dp[x][1] += min(dp[next][0],dp[next][1]) //x가 어댑터면 , 다음은 어뎁터나 일반인 중 최소
        
    }
    
}

dfs(1)

print(min(dp[1][0],dp[1][1]))
