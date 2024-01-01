import Foundation

extension Array where Element == Int {

    mutating func removeZero() {
        
        while self.last ?? -1 == 0 {
            self.removeLast()
        }  
        
    }
}

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var del = deliveries
    var pic = pickups 
    
    
    del.removeZero()
    pic.removeZero()
    
    var ans: Int = 0 
    
    while !del.isEmpty || !pic.isEmpty {
        
        var nowCap = cap
        ans += max(del.count,pic.count)*2 // 현재 순회에서 갈 가장 먼 집 왕복
        
        while !del.isEmpty {
            
            if del.last ?? 0 > nowCap {
                del[del.count-1] -= nowCap  
                break 
            }
            else {
                nowCap -= del.removeLast()
            }
        }
        
        nowCap = cap 
        while !pic.isEmpty {
            
            if pic.last ?? 0 > nowCap {
                pic[pic.count-1] -= nowCap 
                break 
            }
            else {
                nowCap -= pic.removeLast()
            }
        }
        
        
    }
    
    return Int64(ans)
}