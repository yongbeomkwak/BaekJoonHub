import Foundation

func solution(_ sides:[Int]) -> Int {
    
    let M = sides.max()!
    let m = sides.min()!
    
    var ans:Int = (M..<(M+m)).count + ((M-m+1)..<M).count

    
    
    
    return ans
}