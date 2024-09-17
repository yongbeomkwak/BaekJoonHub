import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func isBalanced(_ w: String) -> Bool {
    
    if w.isEmpty { return false }
    return w.filter{$0 == "("}.count == w.filter{$0 == ")"}.count
}

func isCorrected(_ w: String) -> Bool {
    
    var stack: [String] = []
    
    for i in 0..<w.count {
        if w[i] == "(" {
            stack.append(w[i])
        } else {
            if stack.isEmpty {
                return false 
            }
            let _ = stack.popLast()
        }
    }
    
    return stack.isEmpty
}

func reversed(_ u: String) -> String {
    
    var u = u
    let _ = u.removeFirst()
    let _ = u.removeLast()
    
    return u.map({ $0 == ")" ? "(" : ")" }).joined()
}



func solution(_ w:String) -> String {
    if w.isEmpty || isCorrected(w)  {
        return w
    }
    
    var w = w 
    var u = ""
    var v = ""
    
    while !isBalanced(u)  {
        u += String(w.removeFirst())
    }
    
    v = w
    
    if isCorrected(u) {
        return  u + solution(v)
    }
    

    
    return "(" + solution(v) + ")" + reversed(u)
}