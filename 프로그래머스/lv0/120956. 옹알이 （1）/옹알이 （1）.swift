import Foundation

func solution(_ babbling:[String]) -> Int {

    let words:[String] = ["aya","woo","ye","ma"]
    var ans:Int = 0
     
   
    for s in babbling{
        var check: String = ""
        
        for c in s {
            
            check += String(c)
            
            if(words.contains(check))
            {
                check = ""
            }
        }
        
        
        if(check.isEmpty)
        {
            ans += 1
        }
    }
    
    
    
    return ans
}