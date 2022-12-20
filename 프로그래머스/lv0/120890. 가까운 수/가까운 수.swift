import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    
    var ans:Int = 0 
    var gap:Int = 9999
    
    for i in array{
        if(abs(n-i) < gap)
        {
            gap = abs(n-i)
            ans = i
        }
        else if (abs(n-i) == gap)
        {
            ans = min(ans,i)
        }
    }
    
    
    return ans
}