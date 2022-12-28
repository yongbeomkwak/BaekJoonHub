import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    
    var ans:Bool = false
    for s in dic {
        let ss = String(s)
        
        
        
        if(ss.sorted() == spell.joined().sorted())
        {
            ans = true
            break
        }
    }
    
    
    return ans  ? 1 : 2
}