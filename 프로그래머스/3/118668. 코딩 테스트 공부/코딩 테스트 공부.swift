import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    
    // 모든 문제를 풀어야함 
    
    var maxAlp: Int = 0 // 최대 Alp
    var maxCop: Int = 0 // 최대 Cop
    
    for problem in problems {
        maxAlp = max(maxAlp,problem[0])
        maxCop = max(maxCop,problem[1])
    }
    
    // 초기 상태 초기화
    var alp = min(maxAlp,alp) 
    var cop = min(maxCop,cop)
    
    var dp:[[Int]] = [[Int]](repeating:[Int](repeating:1000000, count: maxCop+2), count: maxAlp+2) 
    
    // dp[alp][cop] =  현재 alp와 cop 도달 시 최소 시간 
    
    // 알고력과 코딩력을 올리는 방법은 다음과 같다.
    // 1. 개인 공불르 통해 알고력 또는 코딩력을 1 증가 시킬 수 있다.
    // 2. 현재 문제를 풀어 reward로 얻을 수 있다. 
    
     dp[alp][cop] = 0
    
    for i in alp...maxAlp {
        for j in cop...maxCop {
            dp[i+1][j] = min(dp[i+1][j], dp[i][j]+1)
            dp[i][j+1] = min(dp[i][j+1], dp[i][j]+1)
            
            for problem in problems {
                let aReq = problem[0]
                let cReq = problem[1]
                let aRew = problem[2]
                let cRew = problem[3]
                let cost = problem[4]
                
                if i >= aReq && j >= cReq {
                    let nextAlp = min(maxAlp,i + aRew)
                    let nextCop = min(maxCop,j + cRew)
                    
                    dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop], dp[i][j] + cost)  
                }

            }
            
        }
    }
    

    return dp[maxAlp][maxCop]
}