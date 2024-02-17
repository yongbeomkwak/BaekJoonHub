let n = Int(readLine()!)!

var buildnigs : [Int] = []

for _ in 0..<n {
    buildnigs.append(Int(readLine()!)!)
}


var stk : [Int] = []
var res : Int = 0


for h in buildnigs {
    
    while !stk.isEmpty && stk.last! <= h {
        stk.popLast()
    }
    
    stk.append(h)
    res += stk.count-1 // 나 자신 빼고
    
}

print(res)


