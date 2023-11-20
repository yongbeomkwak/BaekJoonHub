import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {

    /*
     알고 또는 코딩력을 높이기 위한 방법은 , 1의 시간을 써서 1을 늘리거나
     문제를 풀어 reward를 받거나 
    */
    
    var maxAlp: Int = 0
    var maxCop: Int = 0
    
    for problem in problems {
        maxAlp = max(maxAlp,problem[0])
        maxCop = max(maxCop,problem[1])
    }
    
    var alp = min(maxAlp,alp)
    var cop = min(maxCop,cop)
    
    var dp:[[Int]] = [[Int]](repeating:[Int](repeating:Int.max-1, count: maxCop+1), count: maxAlp+1) // dp[alp][cop] = 현재 alp, cop 일 때 , 소요된 시간  
    
    dp[alp][cop] = 0
    
    for i in alp...maxAlp {
        for j in cop...maxCop {
            
            if i+1 <= maxAlp {
              dp[i+1][j] = min(dp[i+1][j],dp[i][j]+1) // 알고력+1을 할 때 시간이, 현재에서 1시간 공부할 때랑 최솟값 비교
            }
            
            if j+1 <= maxCop {
              dp[i][j+1] = min(dp[i][j+1], dp[i][j]+1) // 코딩력+1을 할 때 시간이, 현재에서 1시간 공부할 때랑 최솟값 비교
            }
            
            
            for problem in problems {
                
                let alpReq = problem[0]
                let copReq = problem[1]
                let alpRwd = problem[2]
                let copRwd = problem[3]
                let cost = problem[4]
                
                if i>=alpReq && j>=copReq { // 풀 수 있다면
            //풀어서 얻은 내 최종 알고,코딩력이 max_alp,max_cop 보다크면 그대로 max_alp,max_cop 에 저장 
                    let nextAlp = min(maxAlp,i + alpRwd)
                    let nextCop = min(maxCop,j + copRwd)
                    
                dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop],dp[i][j] + cost) // 현재까지 값과 지금 문제를 풀었을 때 중 , 최소시간
                    
                }
                
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}