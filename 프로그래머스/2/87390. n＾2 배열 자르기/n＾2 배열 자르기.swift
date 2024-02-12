import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    var arr : [Int] = []
    
    for i in left...right{
        
        let nn = Int64(n)
        
        let a :Int = Int(i/nn)
        let b : Int = Int(i%nn)
        
        arr.append(max(a,b)+1)
        
    }
    
    
    
    
    return arr
}