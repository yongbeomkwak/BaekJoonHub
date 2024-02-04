let NOTFOUND = "FRULA"

var s = readLine()!.map{String($0)}
let bomb = readLine()!.map{String($0)}



var stk :[String] = []

for i in 0..<s.count {
    stk.append(s[i])
    
    if stk.count >= bomb.count { // 폭발가능성 있음
        
        var haveBomb = true
        
        for j in 0..<bomb.count {
            
            //  stk = abcd
            //  bomb = cd
            // stk.count - bomb.count - j ,4-2 +0 = 2 = stk[2] = c , 4-2+1 = 3 , stk[3] = d
 
            if stk[stk.count-bomb.count+j] != bomb[j] {
                haveBomb = false
                break
            }
            
        }
        
        if haveBomb { // 뒤에 문자열 폭발
            
            for _ in 0..<bomb.count {
                stk.popLast()!
            }
            
        }
        
    }
    
}

if stk.isEmpty {
    print(NOTFOUND)
} else {
    print(stk.joined())
}
