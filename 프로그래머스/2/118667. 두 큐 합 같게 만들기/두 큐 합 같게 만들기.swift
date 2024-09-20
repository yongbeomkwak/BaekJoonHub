import Foundation

var queue1: [Int] = []
var queue2: [Int] = []

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var ans: Int = -1 
    var count: Int = 0
    let length = queue1.count
    
    var startQueueState: [Int] = queue1  

    var queue1 = queue1
    var queue2 = queue2 
    
    var sum1 = queue1.reduce(0,+)
    var sum2 = queue2.reduce(0,+)
    
    var q1Left: Int = 0
    var q2Left: Int = 0
    var q1Right: Int = queue1.count
    var q2Right: Int = queue2.count

    if sum1 == sum2 {
        return 0
    }
    
    repeat {
    
        if sum1 > sum2 {
            let poppedNumber = queue1[q1Left]
            q1Left += 1
            queue2.append(poppedNumber)
            sum2 += poppedNumber
            sum1 -= poppedNumber
            q2Right += 1
            count += 1
            
        } else if sum1 < sum2 {
            let poppedNumber = queue2[q2Left]
            q2Left += 1
            queue1.append(poppedNumber)
            sum1 += poppedNumber
            sum2 -= poppedNumber
            q1Right += 1
            count += 1
            
        } else {
            ans = count
            break 
        }
        
    } while count < length * 3  && q1Left < q1Right && q2Left < q2Right
    

    
    return ans
}