import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var hash: [String:Int] = [:]
    
    for cloth in clothes {
        hash[cloth[1],default:1] += 1 
    }
    
    var result: Int = 1
    
    for v in hash.values {
        result *= v
    }
    

    
    return result-1
}