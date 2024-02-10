import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0

    let n = A.count 
    
    var a = A.sorted(by:<)
    var b = B.sorted(by:>)
    
    for i in 0..<n {
        ans += a[i] * b[i]
    }
    

    return ans
}