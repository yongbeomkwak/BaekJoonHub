import Foundation

func solution(_ s:String) -> Int {
    
        
    func isRight(_ s: [Character] ) -> Bool {
        
        var stk : [Character] = []
        
        for c in s {
            
            
            if c == "[" || c == "(" || c == "{" {
                stk.append(c)
            } else {
                
                if stk.isEmpty {
                    return false 
                }
                
                
                let element = stk.popLast()!
                
                if element == "{" && c == "}" {
                    continue 
                } else if element == "[" && c == "]" {
                    continue 
                } else if element == "(" && c == ")" {
                    continue
                } else {
                    return false 
                }
                
            }
            
            
            
        }
        
        return stk.isEmpty
        
    }
    
    var s = Array(s)
    let k = s.count
    var ans: Int = 0
    for _ in 0..<k {
        ans += isRight(s) ? 1 : 0
        s.insert(s.popLast()!,at:0)
    }

    return ans
}