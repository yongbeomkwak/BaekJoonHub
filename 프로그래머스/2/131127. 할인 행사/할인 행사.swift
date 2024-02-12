import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var target : [String:Int] = [:]
    
    for (n,w) in zip(number,want) {
        target[w] = n 
    }
    
    var ans: Int = 0
    
    outer: for i in 0...discount.count-10 {
        
        var curr: [String:Int] = [:]
        var flag: Bool = true 
        
        for j in 0...9 {
            curr[discount[i+j],default:0] += 1 
        }
        
        for k in target.keys {
           if curr[k] == nil { // 현재 세일 품목에 없거나
               flag = false 
               break
           } 
            
           if curr[k]! < target[k]! {  // 현재 세일 품목 갯수가 부족
                flag = false 
               break
           }
        }
        
        if flag {
            ans += 1
        }
        
    }
    
    return ans
}