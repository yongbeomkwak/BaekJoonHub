var str = Array(readLine()!.map{String($0)})
let bomb = Array(readLine()!.map{String($0)})
var stk: [String] = []

for i in 0..<str.count {
    
    stk.append(str[i])
    
    if stk.count >= bomb.count {
        
        var haveBomb = true
        
        for j in 0..<bomb.count {
            
            if stk[stk.count-bomb.count+j] != bomb[j] {
                haveBomb = false
                break
            }
            
        }
    
        if haveBomb {
            for _ in 0..<bomb.count { stk.popLast() }
        }
        
    }
    
}

let NOTFOUND = "FRULA"

if stk.isEmpty {
    print(NOTFOUND)
} else {
    print(stk.joined())
}
