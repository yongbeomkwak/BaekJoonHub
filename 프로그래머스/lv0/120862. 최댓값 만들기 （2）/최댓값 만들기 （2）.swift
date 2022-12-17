import Foundation

func solution(_ numbers:[Int]) -> Int {
    
    let sortedArr = numbers.sorted()
    let l = numbers.count
    
    let a = sortedArr[0]
    let b = sortedArr[1]
    let c = sortedArr[l-1]
    let d = sortedArr[l-2]
    
    
    
    return a*b > c*d ? a*b : c*d
    
}