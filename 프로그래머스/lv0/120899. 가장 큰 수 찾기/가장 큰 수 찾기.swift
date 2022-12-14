import Foundation

func solution(_ array:[Int]) -> [Int] {
    var ans:[Int] = []
    let M = array.max()!
    ans.append(M)
    ans.append(array.firstIndex(of:M)!)
    return ans
}