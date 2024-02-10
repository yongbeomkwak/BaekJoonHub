import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    
    var nowA = max(a,b)
    var nowB = min(a,b)
    var round:Int = 0
    
    while nowA != nowB {
                
        nowA = nowA/2 + nowA%2
        nowB = nowB/2 + nowB%2
        round += 1 
    }


    return round
}