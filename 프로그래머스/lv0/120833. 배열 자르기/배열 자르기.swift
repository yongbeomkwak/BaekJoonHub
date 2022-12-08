import Foundation

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    
    var ans = Array<Int>()
    
    for i in num1...num2{
        ans.append(numbers[i])
    }
    
    return ans
}