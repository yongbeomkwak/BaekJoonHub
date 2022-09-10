import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    let sort = d.sorted()
    var remain = budget 
    var result:Int = 0 
    
    for i in sort{
        if(remain - i >= 0)
        {
            result += 1
        }
        remain -= i
    }
    
    return result
    
    
}