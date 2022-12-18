import Foundation

func solution(_ my_string:String) -> String {
    
    var check:Dictionary<String, Bool> = [:]
    var ans = ""
    
    for s in my_string {
        let cs = String(s)
        
        if(check[cs] != nil){
            continue
        }
        else
        {
            ans += cs
            check[cs] = true
        }
        
    }
    
    
    return ans
}