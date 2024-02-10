import Foundation

func solution(_ s:String) -> Int{
    
    var answer:Int = -1

    var stk: [Character] = []
    var arr = Array(s)
    
    for i in 0..<s.count {
        
        if stk.isEmpty {
            stk.append(arr[i])
            continue
        }
        
        if stk.last! == arr[i] {
            stk.popLast()
        } else {
            stk.append(arr[i])
        }
        
    }
    

    return stk.isEmpty ? 1 : 0
}