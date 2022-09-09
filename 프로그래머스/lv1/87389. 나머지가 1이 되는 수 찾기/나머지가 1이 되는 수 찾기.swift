import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 1
    
    for i in 1..<n {
        if(n%i == 1)
        {
            ans = i
            break
        }
    }
    
    return ans
}