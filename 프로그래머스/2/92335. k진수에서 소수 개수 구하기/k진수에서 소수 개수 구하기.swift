import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    var s = String(n,radix:k)
    var arr = s.split{ $0 == "0"}.map{Int(String($0))!}
    
    var isPrime: ((Int) -> Bool) = { n -> Bool in 
        
        var end = Int(sqrt(Double(n)))
        
        if n == 1 {
            return false 
        } else if n == 2 || n == 3 {
            return true 
        }
        
        for i in 2..<end+1 {
            
            if n%i == 0 {
                return false
            }
            
        }
        
        return true
    }
    
    
    return arr.filter{isPrime($0)}.count
}