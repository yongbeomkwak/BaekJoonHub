import Foundation

let find:  (Int) -> Bool = { (n:Int) in
    
    for i in 2..<n{
        if(n%i == 0)
        {
            return true
        }
    }
    return false
} 

func solution(_ n:Int) -> Int {
    
    var ans:Int = 0
    
    if(n <= 3)
    {
        return 0 
    }
    
    for i in 4...n{
        if(find(i)) {
            ans += 1
        }
    }
    
    
    return ans
}