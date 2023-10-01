import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    let n = numbers.count
    
    var ans:[Int] = [Int](repeating:-1,count:n)
    
    var stk:[Int] = []
    
    for (i,number) in numbers.enumerated() {
        
        while !stk.isEmpty, numbers[stk.last!] < number {
            ans[stk.popLast()!] = number            
        }
        stk.append(i)
    }
    
    return ans
}