import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {

    var del: Int = 0
    var pic: Int = 0
    
    var dist: Int = 0 
    
    for index in stride(from:n-1, through:0, by: -1) {
        
        del += deliveries[index] 
        pic += pickups[index] 
        
        while del > 0 || pic > 0 { // 들고있는게 있다면 (배달 or 수거 해야할것)
            dist += (index+1) * 2 // 왕복 거리 
            // 한번 왕복마다 cap 만큼 뺀다.
            del -= cap 
            pic -= cap 
            
            // 음수가 되도 되는 이유는 다음 왕복 때 추가가되었는데 그게 0 이하면 이전 왕복 때 했다고 생각할 수 있다.
        }
        
    }
    
    return Int64(dist)
}