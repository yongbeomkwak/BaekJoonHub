import Foundation

func solution(_ s:String) -> Bool
{
    
    var cnt: Int = 0
    
  
    for c in s {
        
        if cnt == 0 && c == ")" {
            return false 
        }
        
        if c == "(" {
            cnt += 1
        } else {
            cnt -= 1
        }
        
        
        
    }

    return cnt == 0
}