import Foundation

func solution(_ price:Int) -> Int {
    
    let n1:Int = 100000
    let n2:Int = 300000
    let n3:Int = 500000
    
    switch price{
        case 0..<n1:
            return price
        
        case n1..<n2:
            return (price * 95) / 100
        
        case n2..<n3:
            return (price * 90) / 100
        
        
        default:
            return (price * 80) / 100
        
 
    }
    
    return 0
}