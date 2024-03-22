let ns = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,s) = (ns[0],ns[1])

var arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var ans:Int = 0


var visited: [Bool] = [Bool](repeating: false, count: n)

func dfs(_ index:Int, _ depth: Int,_ limit: Int,_ now: Int) {
    if depth == limit {
       
        if now == s {
            ans += 1
        }
        
        return
    }
    
    
    for i in index..<n {
        
        if visited[i] == true {
            continue
        }
        
        visited[i] = true
        dfs(i+1, depth+1, limit, now+arr[i])
        visited[i] = false
    }
        

}


for i in 1...n {
    dfs(0, 0, i, 0)
}

print(ans)
