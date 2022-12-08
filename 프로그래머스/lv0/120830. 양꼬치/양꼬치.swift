import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let ggo:Int = 12000
    let beverage:Int = 2000
    
    let free:Int = (n/10) 
    
    let kk = free >= k ? 0 : k - free
    
    return (ggo * n)  + (beverage * kk)
    
    
    
    
}