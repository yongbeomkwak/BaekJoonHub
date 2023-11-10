import Foundation



func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var totalQueue = queue1 + queue2 
    
    var sum1 = queue1.reduce(0,+)
    
    var sum2 = queue2.reduce(0,+)
    
    var target = (sum1+sum2)/2
    
    if target < queue1.max()! || target < queue2.max()! || (sum1+sum2)%2 != 0 {
        // 타겟을 넘어가는 숫자가 존재하거나 , 타겟이 홀 수 이면 아예 불가능
        return -1
    }
    
    var left = 0
    var right = queue1.count // 투포인터 
    var answer = 0
    
    while (left <= right) && (right < totalQueue.count) { // 범위를 벗어나거나면
        
        if sum1 == target {
            return answer
        }
        
        if sum1 > sum2 {  // 왼쪽이 큼
            
            sum1 -= totalQueue[left]
            sum2 += totalQueue[left]
            left += 1
            
        }
        
        else { // 오른쪽이 큼 
            sum2 -= totalQueue[right]
            sum1 += totalQueue[right]
            right += 1
        }
        
        answer += 1
        
    } 
    
    
    
    
    return  -1
}