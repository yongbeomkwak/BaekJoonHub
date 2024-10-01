import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    // 귤의 크기를 최소화
    
    var hash: [Int: Int] = [:]
    
   for t in tangerine {
       hash[t, default:0] += 1
    }

    var ans:Int = 0  
    var k = k
    
    for (size, count) in  hash.sorted(by: { $0.value > $1.value }) {
        if k <= 0 {
            break
        } else {
            k -= count 
            ans += 1
        }
    }
    
    
    return ans
}