import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var sortedA = a.sorted(by:>)
    var sortedB = b.sorted(by:>)
    
    var answer:Int = 0
    let n = a.count
    var index:Int = 0 
    
    for a in sortedA {
        if  index < n && a < sortedB[index]  {
            answer += 1
            index += 1
        }
    }
    

    
    return index
}