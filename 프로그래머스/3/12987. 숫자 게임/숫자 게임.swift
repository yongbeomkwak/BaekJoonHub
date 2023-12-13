import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var a = a.sorted(by:>)
    var b = b.sorted(by:>)
    
    var ans: Int = 0

    var aIndex = a.count-1
    var bIndex = b.count-1
    for _ in 0..<a.count {
        
        if a[aIndex] < b[bIndex] { // 조건 만족하면 각 각 공개 
            aIndex -= 1
            bIndex -= 1
            ans += 1
        } else { // b가 현재 a 못이기면 그냥 버림(나중에 A에서 큰 카드들과 붙음)
            bIndex -= 1
        }
        
    } 
    
    
    return ans
}