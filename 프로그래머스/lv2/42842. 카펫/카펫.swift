import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    
    var w:Int = 3
    
    var ans:[Int] = .init()
    
    let total:Int = brown + yellow
    
    while true {
        
        for h in 3...w{
            
            if(h*w != total){
                continue
            }
                
            
            if (w-2) * (h-2) == yellow {
                ans.append(w)
                ans.append(h)
                break
            }
            
        }
        
        if !ans.isEmpty{
            break
        }
        
        w += 1
    }
    
    
    return ans
}