import Foundation

func solution(_ numbers:[Int]) -> Int {
    
    let sortedN = numbers.sorted()
    let n = sortedN.count
    return sortedN[n-1] * sortedN[n-2]
}