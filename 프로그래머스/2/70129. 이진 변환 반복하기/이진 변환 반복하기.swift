import Foundation

func solution(_ s:String) -> [Int] {
    
    var s = s
    
    var ans: [Int] = [0,0]
    
    while s != "1" {
        
        let oneCount = s.filter{$0 == "1"}.count
        let n = s.count
        
        
        ans[0] += 1
        ans[1] += n-oneCount
        
        s = String(oneCount,radix:2)
    }
    
    return ans
}