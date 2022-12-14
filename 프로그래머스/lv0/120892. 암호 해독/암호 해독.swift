import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    
    var ans = ""
    let l = cipher.count
    for i in 0..<l {
        if((i+1)%code == 0 )
        {
           ans += String(cipher[cipher.index(cipher.startIndex, offsetBy: i)]) 
        }
        
    }
    
    return ans
}