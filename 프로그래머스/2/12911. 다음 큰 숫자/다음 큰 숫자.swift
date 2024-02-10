import Foundation

func solution(_ n:Int) -> Int
{
    var answer: Int = 0
    var n = n 
    
    var target = String(n,radix:2).filter{$0 == "1"}.count
    
    while true {
        n += 1
        
        if target == String(n,radix:2).filter{$0 == "1"}.count {
            answer = n 
            break
        }
        
    } 
    
    
    return answer
}