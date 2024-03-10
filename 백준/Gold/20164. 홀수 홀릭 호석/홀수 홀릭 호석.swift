import Foundation

extension String {
    
    subscript(_ index:Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}

func countOdd(_ s:String) -> Int {
    
    var count: Int = 0
    
    for i in 0..<s.count {
        if Int(s[i])! % 2 != 0  {
            count += 1
        }
    }
    
    return count
}

func slice(_ number: Int) -> (Int,Int)  {
    
    var s = String(number)
    var oddCount: Int = countOdd(s)
    
    if s.count == 1 {
        return (oddCount,oddCount)
    } else if s.count == 2 {
        
        let n1 = Int(s[0])!
        let n2 = Int(s[1])!
        
        let next = slice(n1+n2)
        
        return (oddCount + next.0, oddCount + next.1)
    } else {
        
        var minV = Int.max
        var maxV = Int.min
        
        // 12345 | 12345 | 12345
        //       벽1     벽2
        
        for i in 1...s.count-2 { // 3 구간으로 나눌 벽1
            let n1 = Int(s[0..<i])!
            
            for j in i..<s.count-1 { // 3 구간으로 나눌 벽2
                let n2 = Int(s[i..<j+1])!
                let n3 = Int(s[j+1..<s.count])!
                
                
                let ret = slice(n1+n2+n3)
                
                minV = min(minV,ret.0)
                maxV = max(maxV,ret.1)
                
            }
            
        }
        
        return (minV+oddCount,maxV+oddCount)
    }
    
   
}

var n = Int(readLine()!)!

let result = slice(n)

print("\(result.0) \(result.1)")
