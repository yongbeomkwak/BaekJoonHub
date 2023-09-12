import Foundation

extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}

func invert(_ s:String) -> String{
    
    return s == ")" ? "(" :")"
}

func isBalance(_ s:String) -> Bool {
    
    var `left`:Int = 0
    
    for c in s {
        if c == "(" {
            left += 1
        }
    }
    
    return s.count - left == left 
}

func isPerfect(_ s:String) -> Bool {
    
    var stk:[String] = .init()
    
    
    for i in 0..<s.count {
        
        if s[i] == "(" {
            stk.append(s[i])
            continue
        } 
        
        else {
            if stk.isEmpty {
                return false 
            }
            let _ = stk.popLast()!
        }
        
    }
    
    return stk.isEmpty
}

func solution(_ p:String) -> String {
    
    
    if p.isEmpty || isPerfect(p) { // 1
        return p
    }
    
    var u = "", v = ""
    
    
    for i in 0..<p.count { //2
        u += p[i] 
        
        if isBalance(u) {
            
            if i+1 < p.count-1 {
                v = p[i+1..<p.count]
                break
            }
        }
    }
    
    if isPerfect(u) {
        return u + solution(v) // 3-1 
    }
    
    
    var invertedU = ""
    
    u.removeFirst()
    u.removeLast()
    for i in 0..<u.count {
        invertedU += invert(u[i])
    }
        
        
    return "(" + solution(v) + ")" + invertedU
    
    
    

    
}