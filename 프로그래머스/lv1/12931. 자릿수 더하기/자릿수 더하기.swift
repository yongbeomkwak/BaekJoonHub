import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    let nString:String = String(n)
    
    for c in nString{
        answer += Int(String(c))!
    }
    
    
    
    return answer
}