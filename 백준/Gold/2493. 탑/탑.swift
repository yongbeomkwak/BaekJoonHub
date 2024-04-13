import Foundation

let n = Int(readLine()!)!

var stk = readLine()!.split{$0 == " "}.map{Int($0)!}

var tmp :[(Int,Int)] = []

var height: [Int] = [Int](repeating: 0, count: n)

var index = n-1


while !stk.isEmpty {
    
    
    let h = stk.popLast()!

    
    while !tmp.isEmpty && tmp.last!.1 <= h {
        
        let l = tmp.popLast()!
        
        height[l.0] = index+1
        
    }
    
    tmp.append((index, h))
    
    index -= 1
}

print(height.map{String($0)}.joined(separator:" "))
