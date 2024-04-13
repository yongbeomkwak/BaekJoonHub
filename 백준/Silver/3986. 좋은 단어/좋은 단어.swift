import Foundation

let n = Int(readLine()!)!


var ans: Int = 0

for _ in 0..<n {
    let arr = Array(readLine()!)

    if arr.count == 1 {
        ans += 1
        continue
    }
    
    var stk:[Character] = [arr[0]]

    for i in 1..<arr.count {
        
        if !stk.isEmpty && stk.last! == arr[i] {
            let _ = stk.popLast()
        } else {
            stk.append(arr[i])
        }
        
    }
    
    if stk.isEmpty {
        ans += 1
    }
}

print(ans)
