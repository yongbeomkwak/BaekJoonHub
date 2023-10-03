import Foundation

func solution(_ sticker:[Int]) -> Int{    
    let n:Int = sticker.count
    
    if n <= 2 {
        return sticker.max()!
    }
    
    var dp:[Int] = [Int](repeating:0,count:n) // 첫 번째 스티커를 땠을 경우
    var dp2:[Int] = [Int](repeating:0,count:n)
    
    dp[0] = sticker[0] // 첫 번째 스티커 땠으니
    dp[1] = sticker[0] // 첫 번째 스티커를 땠으니 2번째는 당연히 못땜 그래서 이전 값 그대로
    
    dp2[1] = sticker[1] // 첫 번째 스티커를 안 땠으니 2번째는 2번째 그대로
    for i in 2..<n {
        
        if i < n-1 { // 첫 번째 스티커를 땠으니 마지막 스티커를 못 건듬
            dp[i] = max(dp[i-2]+sticker[i],dp[i-1]) // i-2 + 현재 , i-1 
        }
        
        dp2[i] = max(dp2[i-2]+sticker[i],dp2[i-1])
    }
    
    
    return max(dp.max()!,dp2.max()!)
}