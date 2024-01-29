var s = readLine()!
var t = readLine()!


var ans: Int = 0


func dfs(_ str: String) {
    
    if str.count == s.count {
        
        if str == s {
            ans = 1
        }
        
        return
    }
    
    
    
    if str.last == "A" {
        var str = str
        str.popLast()
        dfs(str)
    }
    
    if str.first == "B" { // 뒤집힐 가능성 있음
        var str = str
        str = String(str.reversed())
        str.popLast()!
        dfs(str)
    }

}

dfs(t)


print(ans)
