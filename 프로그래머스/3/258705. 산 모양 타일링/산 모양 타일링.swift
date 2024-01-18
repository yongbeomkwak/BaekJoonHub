import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    
    let DIV: Int = 10007
    
    var dp: [[Int]] = [[Int]](repeating:[0,0],count:n+1) // dp[i][0] = i 번째 윗변에 왼쪽 사다리꼴을 쓸 경우 , dp[i][1] = i 번째 오른쪽 사다리꼴 쓸경우 
    
    dp[0][0] = 1 // 
    
    for i in 0..<n {
        
        if tops[i] == 1 { // 세로형을 사용할 수 있음 
            
            //i+1에 왼쪽꺼를 놓을려면 , i번째는 오른쪽 거를 놓으면 안됨
            
            // dp[i][0] = (오른쪽 꺼 사용불가)  왼쪽형 ,세로형 , 그냥 정삼각형 = 3 
            
            // dp[i][1] = (왼쪽꺼 사용 불가)  정삼각형, 세로 = 2
        
            dp[i+1][0] = dp[i][0]*3 + dp[i][1]*2 
        }
        
        else { // 세로형 사용 불가 , 위와 똑같지만 세로형 만 빼야됨
            
            dp[i+1][0] = dp[i][0]*2 + dp[i][1]*1
        }
        
         //i+1에 오른쪽 껄 놓을 때는 i번째가 왼쪽이든 오른쪽이든 상관 없음
        dp[i+1][1] = (dp[i][0] + dp[i][1]) % DIV
        
        dp[i+1][0] %= DIV 
        
       
        
        
    }

    
    return (dp[n][1] + dp[n][0]) % DIV
}