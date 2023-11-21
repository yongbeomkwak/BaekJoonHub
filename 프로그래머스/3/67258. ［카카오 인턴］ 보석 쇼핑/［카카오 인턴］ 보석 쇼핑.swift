import Foundation


func solution(_ gems:[String]) -> [Int] {
    
    
    var kind = Set(gems).count
 
    if kind == 1 {
        return [1,1]
    }
    
    var start = 0
    var end = 0
    var dist = 1000001 
    var ans:[Int] = [0,gems.count]
    
    var dict = [String:Int]() // 해당 복수 개수   
    
    while start <= end {
    
        
        if dict.count >= kind { // 모든 종류를 다담으았으면
            
            dict[gems[start]]!-=1 //왼쪽 뺘고
            
            if dict[gems[start]]! == 0 { // 뺀 후 0이면 ,key 제거 
                dict[gems[start]] = nil
            }
            
            
            start+=1 
            
        } else if end == gems.count {break} // 범위 벗어 났으면 break
        
        else {
            dict[gems[end]] = dict[gems[end],default:0]+1
            end+=1
        }
        
        
        if dict.count == kind , dist > end-start  { // 제거한 후 역시 모든 종류 보석 같고 있으면 최소 거리 비교
        
            dist = end-start
            ans[0] = start+1
            ans[1] = end
        }
            
         

    }
    
    return ans
}