import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var prev:[[Bool]] = [[Bool]](repeating:Array(repeating:false,count:n+1),count:n+1)
    
    
    for result in results {
        
        let a = result[0]
        let b = result[1]
        
        prev[a][b] = true
    }
    
    var count:Int = 0
    
    for k in 1...n{
        for i in 1...n {
            
            for j in 1...n {
                
                if prev[i][k] && prev[k][j] { // i가 k이기고, k가 j이기면 
                    prev[i][j] = true // i가 j 이김
                }
                
            }
            
        }
    }
    
    
    for i in 1...n{
        
        var undecided:Int = n-1 // 자신은 제외
        
        for j in 1...n{
            
            
            
            if prev[i][j] || prev[j][i] { // 승패 하나라도 있으면 결정됨
                undecided -= 1
            }
            
        }
        
        if undecided == 0 { 
            count += 1 
        } //만약 정해지지 않은 상대가 없으면 , 정확한 순위를 매길 수 있음
    }
    
    
    return count
}