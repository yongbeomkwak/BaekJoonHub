import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    let n = numbers.count
    
    var stk: [Int] = []
    
    var ans: [Int] = [Int](repeating:-1, count:n)
    
    
    for i in stride(from: n-1,to: -1,by: -1) {
        
        let number = numbers[i]
        
        while !stk.isEmpty && numbers[i] >= stk.last! {
            let _ = stk.popLast()
        }
        
        if !stk.isEmpty {
            ans[i] = stk.last! 
        }
        
        
        
        stk.append(number)
    }
    

    
    
    
    return ans
}