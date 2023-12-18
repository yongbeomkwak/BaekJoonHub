import Foundation
func countZero(_ stones:[Int],_ limit:Int, _ k:Int) -> Bool {
 
    var stone = 0
    for i in 0..<stones.count {
        if stones[i] - limit <= 0 { stone += 1 }
        else { stone = 0 }

        if stone >= k { return false }
    }

    return true
}

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    
    var l: Int =  stones.min()!
    var r: Int =  stones.max()!
    
    var mid: Int {
        return (l+r)/2
    }
    
    
    while l<=r {
        
        if countZero(stones,mid,k) { // 건넘
            l = mid+1
            
        } else {
            r = mid-1
        }
        
    }
    
    
    return l
    

}