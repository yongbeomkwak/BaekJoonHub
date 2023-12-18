import Foundation



func permutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)
    
    func permut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<elements.count {
            if visited[i] == true { continue }
            visited[i] = true
            permut(now + [elements[i]])
            visited[i] = false
        }
    }
    
    permut([])
    return result
}

func calc(_ priority:[Character],_ numbers:[Int64], _ opers:[Character]) -> Int64 {
    
    var numbers = numbers
    var opers = opers
    
    for op in priority {
        
        while let index = opers.firstIndex(of:op) {
            
            if op == "+" {
                
                numbers[index] += numbers[index+1] 
            } else if op == "*" {
                
                numbers[index] *= numbers[index+1]
            } else {
                numbers[index] -= numbers[index+1]
            }
            
            numbers.remove(at:index+1)
            opers.remove(at:index)
            
        }
        
    }
    return abs(numbers[0])
}

func solution(_ expression:String) -> Int64 {
    
    var opers: [Character] = []
    
    for exp in expression {
        
        if exp == "*" || exp == "+" || exp == "-" {
            opers.append(exp)
        }
    }
    
    var numbers: [Int64] =  expression.components(separatedBy: ["*", "+", "-"]).map{abs(Int64($0)!)}
    
    let const_opers: [Character] = ["+","*","-"]
    
    let perm = permutation(const_opers,3)
    
    var ans:Int64 = -100 
    
    for p in perm {
        ans = max(ans,calc(p,numbers,opers))
    }
    
    
    
    
    
    return ans
}