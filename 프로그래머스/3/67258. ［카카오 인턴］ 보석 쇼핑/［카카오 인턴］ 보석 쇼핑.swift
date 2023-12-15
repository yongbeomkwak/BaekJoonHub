import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    var left = 0 
    var right = 0
    
    let target = Set(gems).count
    
    if target == 1 {
        return [1,1]
    }
    
    var bag: [String:Int] = [:]
    
    var dist = 100001
    
    var ans:[Int] = [0,0]
    
    while left <= right {
        
        var jwt = gems[left]
        
        if bag.count >= target { // 조건을 만족 
            
            if bag[jwt,default:0] > 1 { // 1초과 이면 제거
                bag[jwt]! -= 1
            } else { // 1개 이하면, 값 비워줌 
                bag[jwt] = nil 
            }
            
            left += 1
        } else if right == gems.count { // right이 끝에 도달하면 종료 
            break
        }
        
        else { // 아직 모든 종료를 다 담지 못했으면
            
            jwt = gems[right]
            
            bag[jwt] = bag[jwt,default:0]+1
            
            right += 1 
        }
        
        if bag.count == target , dist > right - left { // 모든 종류를 담고 최소거리보다 작을 때 
            
            dist = right - left
            ans[0] = left+1 
            ans[1] = right
        }

    }
    
    
    return ans
}