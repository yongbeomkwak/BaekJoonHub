import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    let n = sequence.count 
    
    var max_sum = 0
    var end = 0
    var interval = n
    
    var res: [Int] = []

    for start in 0..<n{
        while max_sum < k && end < n {
            max_sum += sequence[end]
            end += 1
        }
            
        if max_sum >= k {
            
            if max_sum == k && end-1-start < interval {
                 res = [start, end-1]
            }
            
            interval = end-1-start
            max_sum -= sequence[start]
        }
        

    }
         

    return res
  
    
    
    return []
}