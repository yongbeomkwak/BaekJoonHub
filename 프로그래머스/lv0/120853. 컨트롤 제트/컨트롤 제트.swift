import Foundation

func solution(_ s:String) -> Int {
    
    var ans:Int = 0 
    var prev:Int = 0
    for c in s.components(separatedBy:" ") {
        if(c == "Z")
        {
            ans -= prev
            prev = 0
        }
        else
        {
            prev = Int(String(c))!
            ans += prev
        }
    }
    
    return ans
}