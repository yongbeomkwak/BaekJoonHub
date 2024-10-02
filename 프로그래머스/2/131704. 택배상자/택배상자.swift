import Foundation

func solution(_ order:[Int]) -> Int {
    let n = order.count
    var priority: [Int] = [Int](repeating: 0, count: n)
    
    for i in 0..<n {
        priority[order[i]-1] = i
    }
    
    var target: Int = 0
    var stack: [Int] = []
    
    for i in 0..<n {
        if target == priority[i] {
            target += 1 
        } else {
            stack.append(priority[i])
        }
        
         while !stack.isEmpty && stack.last! == target {
                let _ = stack.popLast()
                target += 1
        }
        
    }
    
    return target 
}