import Foundation

func solution(_ s:String) -> [Int] {
    
    var res:[Int] = []
    
    let s = Array(s)
    
    for (i,ss) in s.enumerated() {
        let front = Array(s.prefix(i))
        if let index = front.lastIndex(of:ss) {
 
            res.append(i - index)
        }
        else{
            res.append(-1)
        }
         
        
        
        
        
    }
    
    
    
    return res
}