import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    let n = tickets.count
    
    var hash: [String:[String]] = [:]
    
    for ticket in tickets {
        
        hash[ticket[0],default:[]] += [ticket[1]] 
    }
    
    var visited: [String:Bool] = [:]
    
    var ans: [[String]] = []
    
    func dfs(_ target: String, _ airPorts: [String]) {
        
        if airPorts.count == n+1 {
            ans.append(airPorts)
            return 
        }
        
        for (i,next) in hash[target,default:[]].enumerated() {
            
            let key = "\(target)\(next)\(i)" // 중복 티켓을 방지하기 위해 index까지 사용
            if visited[key,default:false] == true {
                continue
            }
            
            visited[key] = true 
            dfs(next,airPorts + [next])
            visited[key] = false 
            
        }
        
    }
    
    dfs("ICN",["ICN"])
    
    
    return ans.sorted(by:{
        
        for (l,r) in  zip($0,$1) {
            
            if l == r {
                continue
            }
            
            return l < r
            
        }
        
        return false
        
    })[0]
}