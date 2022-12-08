import Foundation

func solution(_ n:Int) -> Int {
    let sq = Int(sqrt(Double(n)))    
    
    
    return  n == sq * sq ? 1 : 2
}