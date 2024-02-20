let n = Int(readLine()!)!
let sign = Array(readLine()!.split{$0 == " "}.map{String($0)})


var visited: [Bool] = [Bool](repeating: false, count: 10)

var minValue = ""
var maxValue = ""

func comp(_ n1: Int,_ n2: Int,_ s: String) -> Bool {
    
    if s == "<" {
        return n1 < n2
    } else {
        return n1 > n2
    }
    
}

func dfs(_ depth: Int ,_ s: String) {
    
    if depth == n+1 {
        
        
        if minValue.isEmpty {
            minValue = s
        } else {
            maxValue = s
        }
        
        return
    }
    

    for i in 0...9 {
        
        if !visited[i] {
            
            if depth == 0 {
                visited[i] = true
                dfs(depth+1, s+"\(i)")
                visited[i] = false
            }
            
            if !s.isEmpty && comp(Int(String(s.last!))!, i, sign[depth-1]) {
                visited[i] = true
                dfs(depth+1, s+"\(i)")
                visited[i] = false
            }
            
            
        }
        
        
        
    }
    
}

dfs(0,"")

print(maxValue)
print(minValue)
