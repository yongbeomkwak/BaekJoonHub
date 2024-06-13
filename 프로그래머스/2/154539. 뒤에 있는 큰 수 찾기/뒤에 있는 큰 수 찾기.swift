import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    let n = numbers.count 

    var answer: [Int] = [Int](repeating:-1,count:n)
    
    var stk: [Int] = []
    
    for i in stride(from:n-1,to: -1,by: -1) {
    
        
        while !stk.isEmpty && stk.last! <= numbers[i] {
            let _ = stk.popLast()
        }
        
        if !stk.isEmpty {
            
            answer[i] = stk.last!
        }
        
        stk.append(numbers[i])
        
        
    }
    
    
    return answer
}