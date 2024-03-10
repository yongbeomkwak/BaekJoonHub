var s = readLine()!

var stk: [String] = []

var tag: Bool = false

var result: [String] = []

func pop() {
    while !stk.isEmpty {
        result.append(stk.popLast()!)
    }
}

for c in s {
    
    if c == ">" {
        result.append(String(c))
        tag = false
        continue
    }
    
    if tag == true {
        result.append(String(c))
        continue
    }
    
    if c == "<" {
        
        pop()
        
        result.append(String(c))
        tag = true
        continue
    }
     
    if c == " " {
        
        pop()
        
        result.append(String(" "))
        continue
        
    }
    
    stk.append(String(c))
    
}

pop()

print(result.joined())
