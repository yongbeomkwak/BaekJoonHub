import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    var kind = Set(gems).count
    
    if kind == 1 {
        return [1,1]
    }
    
    var `left` :Int = 0 
    var `right` :Int = 0 
    
    let len = gems.count
    
    var bag:[String:Int] = .init()
    
    var ans:[Int] = [1,1]
    
    var shortest:Int = gems.count + 1
    
    while right < len {
        
        let jw = gems[right]
        bag[jw] = bag[jw,default:0] + 1  // 보석 담기 
        right += 1
        
        
        if bag.count == kind { // 모든 종류의 보석을 다 담았다면
            
            while(left<right)
            {
                if(bag[gems[left],default:0]<=1){ // 뺄 보석이 없다면 ?
                    break
                }
                bag[gems[left]] = bag[gems[left]]! - 1
                left += 1
            }
            if(shortest > right-left)
            {
                shortest = right-left
                ans[0] = left+1
                ans[1] = right
            }
           
            
        }
        
        
    }
    
    
    
    return ans
}