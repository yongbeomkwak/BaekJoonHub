let n = Int(String(readLine()!))!
var arr: [[Int]] = [[]]
var visited = Array(repeating: false, count: n + 1)
var result = Int.max

for _ in 1...n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func dfs(_ depth: Int, _ start: Int){
    if depth == n / 2{
        var startTeam = 0
        var linkTeam = 0
        for i in 1...n{
            for j in 1...n {
                if !visited[i] && !visited[j] {
                    linkTeam += arr[i][j - 1]
                }
                if visited[i] && visited[j] {
                    startTeam += arr[i][j - 1]
                }
            }
        }
        result = min(result, abs(startTeam - linkTeam))
        return
    }
    for i in start...n {
        if !visited[i] {
            visited[i] = true
            dfs(depth + 1, i)
            visited[i] = false
        }
    }

}
dfs(0, 0)

print(result)