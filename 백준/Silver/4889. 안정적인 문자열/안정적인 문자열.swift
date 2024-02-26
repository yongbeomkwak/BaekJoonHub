var s = readLine()!
var order: Int = 1

repeat {
    
    var stk: [Character] = []
    
    var notOpend: Int = 0
    
    for c in s {
        
        if c == "}" {
            
            if stk.isEmpty {
                notOpend += 1
                stk.append("{")
            }
            else {
                stk.removeLast()
            }
            
        }
        
        else {
            stk.append(c)
        }
        
    }
    
    
    print("\(order). \(stk.count/2 + notOpend)")
    
    s = readLine()!
    order += 1
} while !s.contains("-")


