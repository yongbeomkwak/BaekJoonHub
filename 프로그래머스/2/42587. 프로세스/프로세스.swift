import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    let count = priorities.count
    
    var pri:[(Int,Int)] = priorities.enumerated().map{($0,$1)} // (index,value)
 
    var result: Int = 0 
    
    while true {
        
        let front = pri.remove(at:0)
        
        if !pri.filter{$0.1 > front.1}.isEmpty { // 나보다 우선순위가 큰 놈이 존재하면 
            pri.append(front) // 다시 뒤로 
        }
        else if front.0 == location {
            result = count - pri.count // 전체 계속 - 남은 계속 = 출력 순서
            break
        }
        
        
        
    }
    
    return result
}