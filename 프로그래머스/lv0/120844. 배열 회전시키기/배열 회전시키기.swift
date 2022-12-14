import Foundation

func solution(_ numbers:[Int], _ dir:String) -> [Int] {
    
    let l = numbers.count
    
    let right = Array(numbers[l-1...l-1] + numbers[0..<l-1])
    let left = Array(numbers[1...l-1] + numbers[0...0])
    
    return dir == "right" ? right : left
    
}

