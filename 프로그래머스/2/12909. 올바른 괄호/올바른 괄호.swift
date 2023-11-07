import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = true
    
    var stk:[Character] = []
    
    for c in s {
       
        if stk.isEmpty && c == ")" {
            ans = false
            break 
        }
        
        if c == "(" {
            stk.append(c)
        }
        
        else {
            stk.removeLast()
        }
        
    }

    return ans && stk.isEmpty
}