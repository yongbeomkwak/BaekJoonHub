import Foundation

func solution(_ s:String) -> String {
    
    let ss = Set(s)
    var ans = ""
    ss.forEach { c in 
        
        if(s.filter{c == $0}.count == 1)
        {
            ans += String(c)
        }
    }
    
    
    
    return String(ans.sorted())
}