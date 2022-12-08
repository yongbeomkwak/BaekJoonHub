import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var ans:String = ""
    
    for s in my_string{
        
        for _ in 0..<n{
            ans += String(s)
        }
        
    }
    return ans
}