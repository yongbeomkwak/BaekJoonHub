import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    
    let sk = String(k)
    var ans:Int = 0
    for n in (i...j) {
        
        let ns = String(n)
        
        ans += ns.filter{String($0) == sk}.count
        
        
        
    }
    
    
    return ans
}