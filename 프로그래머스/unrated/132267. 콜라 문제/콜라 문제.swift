import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var remain:Int = 0
    var now = n 
    var ans:Int = 0
    
    while(now >= a)
    {
        let service = (now/a) * b
        ans += service
        now -= ((now/a) * a)
        now += service
        
       
    }

    
    return ans
}