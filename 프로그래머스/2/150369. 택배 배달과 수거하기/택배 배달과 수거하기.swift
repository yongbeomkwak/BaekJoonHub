import Foundation

extension Array where Element == Int {
    
    mutating func removeZeroToSuffix() {
        
        while self.last ?? -1 == 0 {
            self.removeLast()
        }
        
    }
    
}


func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var del = deliveries
    var pick = pickups 
    var answer:Int = 0
    
    del.removeZeroToSuffix()
    pick.removeZeroToSuffix()
    

    
    while !del.isEmpty || !pick.isEmpty {
        
        answer += max(del.count, pick.count)*2 
        // 배달과 수거 거리중 큰 것을 왕복(*2)
        
        var nowCap = cap
        
        while !del.isEmpty  { // 배달 ㄱㄱ 
            
            if del.last ?? 0  > nowCap { // 들 수 있는 상자보다 많을 때 
                del[del.count-1] -= nowCap 
                break // 다시
            }
            
            else { // 적거나 같으면 이 집은 다시 안와도 됨, 그만 큼 전해주고 , 목적지에서 뺌 
                nowCap -= del.removeLast()
            }
        
        }
        
        nowCap = cap
        
        while !pick.isEmpty  { // 수거 ㄱㄱ 
            
            if pick.last ?? 0 > nowCap { //들 수 있는 상자보다 많을 때 
                pick[pick.count-1] -= nowCap
                break // 다시 복귀
            }
            
            else {
                nowCap -= pick.removeLast()
            }
            
        }
        
    }

    
    return Int64(answer)
}