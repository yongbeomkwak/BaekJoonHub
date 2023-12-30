import Foundation



func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var canWinLion = false
    var arr = [Int](repeating:0,count:11)
    var maxGap = -1
    var result: [Int] = []
    
    func dfs(_ depth: Int,_ start: Int) {
    
        if depth == n {
            
            var lion_score = 0
            var apch_score = 0 
            
            for i in 0...10 {
                
                if arr[i] == 0 && info[i] == 0 { // 아무도 못쏘면
                    continue
                }
                
                if arr[i] > info[i] {
                    lion_score += 10-i
                } else {
                    apch_score += 10-i
                }
                
            }
            
            let gap = lion_score - apch_score
            
            if lion_score > apch_score , maxGap < gap { // 라이언이 이기고 점수차가 최대면  갱신 
                canWinLion = true 
                maxGap = gap 
                result = arr 
            }
            
            return 
        }
        
        for i in start..<11 {
            arr[10-i] += 1 
            dfs(depth+1,i)
            arr[10-i] -= 1
        }
        
    }
    
    dfs(0,0)
    
    if canWinLion == false {
        return [-1]
    }
    
    
    
    
    return result
}