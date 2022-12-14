import Foundation

func solution(_ hp:Int) -> Int {
    
    var total:Int = 0
    var hpp = hp
    
    if hpp >= 5{
        total += hpp / 5
        hpp %= 5
    }
    
    if hpp >= 3{
        total += hpp / 3
        hpp %= 3
    }
    
    if hpp >= 1{
        total += hpp
    }
    
    
    
    
    return total
}