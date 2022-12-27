import Foundation

func solution(_ my_string:String) -> Int {
    
    var ans:Int = 0
    var tmp:Int = 0
    let conv = my_string.map{String($0)}
    for s in conv
    {
        if "0123456789".contains(s) {
            tmp *= 10 
            tmp += Int(s)!
              
        }
        else
        {
            ans += tmp
            tmp = 0
        }
        
        
        
            
            
          
            
    }
    ans += tmp
     
       
    
    return ans
}