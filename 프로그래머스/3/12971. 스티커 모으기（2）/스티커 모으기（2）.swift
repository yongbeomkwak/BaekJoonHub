import Foundation

func solution(_ sticker:[Int]) -> Int{
    
    let n = sticker.count
    
    if n == 1 {
        return sticker[0]
    } else if n == 2 {
        return sticker.max()!
    }
    
    var dp: [Int] = [Int](repeating:0, count:n) // 첫번째꺼 땠을 때
    dp[0] = sticker[0]
    dp[1] = dp[0]
    
    
    for i in 2..<n-1 {
        dp[i] = max(dp[i-2] + sticker[i],dp[i-1]) // i-2까지 최대값 + 현재스티커 또는 i-1 최대값
    }
    
    var dp2 = [Int](repeating:0, count:n) // 첫번째꺼 땠을 때
    
    dp2[1] = sticker[1]
    
    for i in 2..<n {
        dp2[i] = max(dp2[i-2] + sticker[i], dp2[i-1]) // i-2까지 최대값 + 현재스티커 또는 i-1 최대값
    }
    

    return max(dp.max()!,dp2.max()!)
}