let n = Int(readLine()!)!


var visited: [Bool] = [Bool](repeating: false, count: n)

var result : [[String]] = []

func dfs(_ index: Int,_ arr: [Int]){
    
    if index >= n {
        
        result.append(arr.map{String($0)})
        
        return
    }
    
    for i in 0..<n {
        
        if !visited[i] {
            visited[i] = true
            dfs(index+1, arr + [i+1])
            visited[i] = false
        }
        
    }
    
    
}

dfs(0, [])

for s in result {
    print(s.joined(separator: " "))
}
