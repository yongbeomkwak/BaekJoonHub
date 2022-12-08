import Foundation

func solution(_ s1:[String], _ s2:[String]) -> Int {
    var ans:Int = 0
    for i in s1{
        for j in s2{
            if(i == j)
            {
                ans += 1
            }
        }
    }
    
    return ans
}