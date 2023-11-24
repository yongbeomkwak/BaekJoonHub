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

func step1(_ s:String) -> String {
    return s.lowercased()
}

func step2(_ s:String) -> String {
    return s.filter{$0 == "." || $0 == "-" || $0 == "_" || $0.isLetter || $0.isNumber }
}
    
func step3(_ s:String) -> String {
    
    var s = s 
    
    while s.contains("..") {
        s = s.replacingOccurrences(of: "..", with: ".")
    }
    
    return s
}
    
func step4(_ s:String) -> String {
    
    var s = s 
    
   while s.hasPrefix(".") {
       s.removeFirst()
   }
    
    while s.hasSuffix(".") {
        s.removeLast()
    }
    
    return s
}
    
func step5(_ s: String) -> String {
    return s.isEmpty ? "a" : s
}
    
func step6(_ s: String) -> String {
    
    if s.count >= 16 {
        
        var s = s[0..<15]
        
        if s.hasSuffix(".") {
            s.removeLast()
        }
        
        return s
        
    } else {
        return s
    }
    
}
    
func step7(_ s:String) -> String {
    
    var s = s
    
    if s.count <= 2{
        
        while s.count != 3 {
            s += String(s.last!)
        }
        
    }
    
    return s
}

func solution(_ new_id:String) -> String {
    
    var new_id = new_id
    
    new_id = step1(new_id)
    new_id = step2(new_id)
    new_id = step3(new_id)
    new_id = step4(new_id)
    new_id = step5(new_id)
    new_id = step6(new_id)
    new_id = step7(new_id)
    
    
    return new_id
}