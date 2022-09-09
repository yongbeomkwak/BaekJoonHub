import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var ans:Int = 0 
    for i in 0..<a.count{
        ans += a[i] * b[i]
    }
    
    return ans
}