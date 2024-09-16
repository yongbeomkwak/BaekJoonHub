import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex, offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
    
}

func solution(_ s:String) -> Int {
    
    var minLength = s.count 
    
    for compress in stride(from: 1, through: s.count/2, by:1) {

        var count: Int = 1 
        var arr: [String] = []
        var now: String = s[0..<compress]
        var lastCompressedIndex: Int = 0
        
        for i in stride(from:compress, through: s.count - compress ,by:compress) {
            
            let next = s[i..<i+compress]
            
            if now == next  {
                count += 1 
            } else {
                if count != 1 {
                     arr.append("\(count)\(now)")
                } else {
                       arr.append(now)
                }
                now = next
                count = 1 
            }
            
            lastCompressedIndex = i + compress
        } 
        
        
        if count != 1 {
            arr.append("\(count)\(now)")
        } else {
            arr.append(now)
        }
        
        if lastCompressedIndex < s.count {
            arr.append(s[lastCompressedIndex..<s.count])
        }
        

        minLength = min(minLength, arr.joined().count)
        
        
       
    }
    
    
    
    return minLength
}