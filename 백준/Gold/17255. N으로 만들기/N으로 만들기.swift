
extension String {
    subscript(_ index:Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

let n = readLine()!
var ans: Int = 0

var hash: [String:Bool] = [:]

func dfs(_ now:String,_ left:Int, _ right: Int,_ order:String) {

    if now == n && !hash[order,default: false] {
        hash[order] = true
        ans += 1
    }
    
    else {
        
        if left > 0 {
            
            dfs(n[left-1]+now, left-1, right, order + now)
            
        }
        
        if right < n.count-1 {
            
            dfs(now+n[right+1], left, right+1, order + now)
        }
        
    }
    
}

for i in 0..<n.count {
    dfs(n[i], i, i, "")
}

print(ans)
