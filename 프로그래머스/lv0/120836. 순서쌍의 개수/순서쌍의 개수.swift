import Foundation

func solution(_ n:Int) -> Int {
    
    var ans:Int = 0
    
    for i in (1...n){
        if(n % i == 0)
        {
            ans += 1
        }
    }
    
    
    
    
    return ans
}