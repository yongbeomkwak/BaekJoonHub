import Foundation

extension String {
    
    subscript(_ index:Int) -> String {
        return String(self[self.index(self.startIndex,offsetBy:index)])
    }
}


func diff(_ s1:String, _ s2:String) -> Int {
    
    var count: Int = 0
    
    for (c1,c2) in zip(s1,s2) {
        if c1 != c2 {
            count += 1
        }
    }
    
    return count 
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    let n = words.count 
    
    if begin != target && !words.contains(target) {
        return 0
    }
    
    var ans = Int.max 
    
    var visited = [Bool](repeating:false,count:n)
    
    func dfs(_ s: String,_ index:Int,_ count:Int){
        
         if s == target {
                ans = min(ans,count)
                return
        }
        
        if index == n {
            return
        }
        
        
        for i in 0..<n {
        
            if visited[i] == false && diff(s,words[i]) == 1 {
                visited[i] = true 
                dfs(words[i],i+1,count+1)
                visited[i] = false 
            }
            
        }
        
        
    }

    
    dfs(begin,0,0)
    
    
    
    return ans
}