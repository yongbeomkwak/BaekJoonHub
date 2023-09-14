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

func compress(_ s:String, _ width:Int) -> String {
    
    var pattern:String = ""
    var count:Int = 1
    var result = ""
    
    for i in stride(from:0,to:s.count,by:width) {
        
        if i + width >= s.count {
            
            if s[i..<s.count] == pattern {
                count += 1 
            }
            
            else {
                result += count == 1 ? pattern : "\(count)\(pattern)"
                pattern = s[i..<s.count] 
                count = 1
            }
            
        }
        else {
            
            if s[i..<i+width] == pattern {
                count += 1 
            }
            
            else {
                result += count == 1 ?  pattern : "\(count)\(pattern)"
                pattern = s[i..<i+width] // 현재 문자열을 패턴으로
                count = 1
            }
        }
        
    }
    
     result += count == 1 ?  pattern : "\(count)\(pattern)"

    
    return result  
}


func solution(_ s:String) -> Int {
    
        let max = (s.count > 1) ? Int(s.count / 2) : 1
        var result = s.count
        var compressed = ""
        for round in 1...max {
            compressed = compress(s,round)
            if compressed.count < result {
                result = compressed.count
            }
        }
        return result
    
    
}