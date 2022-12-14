import Foundation

func solution(_ my_string:String) -> Int {
    
    var total = 0 
    
    for s in my_string{
        
        guard let conv = Int(String(s)) else {
            continue
        }
        total += conv 
    }
    
    
    return total
}