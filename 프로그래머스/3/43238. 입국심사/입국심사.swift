import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var result: Int64 = Int64.max
    
    let times: [Int64] = times.sorted().map{Int64($0)}
    
    var start: Int64 = 0
    var end: Int64 = times.max()! * Int64(n) 
    
    while start <= end {
        
        let mid: Int64 = (start+end) / 2 
        
         //심사한 사람 수
        var people: Int64 = 0
     	
        for time in times{
            people += mid / time
            
            if people >= n {
                break
            }
        }
        
        if people >= n {
            end = mid - 1
            result = mid
        } else {
            start = mid + 1
        }
        
    }
    
    
    
    return result
}