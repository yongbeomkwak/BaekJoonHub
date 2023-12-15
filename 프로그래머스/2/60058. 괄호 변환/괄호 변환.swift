import Foundation


func isBalanced(_ s:String) -> Bool {
    
    return s.filter{$0 == "("}.count == s.filter{$0 == ")"}.count
}

func isCollected(_ s:String) -> Bool {
    
    if !isBalanced(s) {
        return false 
    }
    
    var stk: [Character] = []
    
    for c in s {
        if !stk.isEmpty && c == ")"  {
            stk.removeLast()
        }
        else {
            stk.append(c)
        }
    }
    
    return stk.isEmpty
}


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

func solution(_ p:String) -> String {
    
    if isCollected(p) {
        return p
    }
    
    var u: String = ""
    var v: String = ""
    
    var flag: Bool = true 
    
    for c in p { // 2 (분리)
        
        if flag {
            u += String(c)
        } else {
            v += String(c)
        } 
        
        if isBalanced(u) { // 균형잡힌 문자열 됬으면 flag 반전
            flag = false
        }
    }
    
    if isCollected(u) { //3 
        return u + solution(v) // 3-1
    }
    
    u.removeFirst() // 4-4
    u.removeLast() // 4-4
    
    u = u.map { // 4-4 (반전)
       return $0 == ")" ? "(" : ")"
    }.joined()
    
    return "("  + solution(v) + ")" + u
}