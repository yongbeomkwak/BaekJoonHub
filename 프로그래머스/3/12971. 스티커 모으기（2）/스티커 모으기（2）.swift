import Foundation

func solution(_ sticker:[Int]) -> Int{
    var ans = 0
    
    let n = sticker.count

    if n <= 2 {
        return sticker.max()!
    }
    
    var dp1: [Int] = [Int](repeating:0,count:n) // 첫번 째 스티커를 땔 때 ,
    var dp2: [Int] = [Int](repeating:0,count:n)

    dp1[0] = sticker[0] // dp1 은 첫번 째 스티커를 선택했으니  마지막 선택 불가
    dp1[1] = sticker[0]
    
    dp2[1] = sticker[1] // dp2는 두번째 스티커 부터 시작 
    
    for i in 2..<n{
        
        dp2[i] = max(dp2[i-2]+sticker[i],dp2[i-1])
        
        if i  < n-1 { // dp1은 마지막 스티커 못씀 
             dp1[i] = max(dp1[i-2]+sticker[i],dp1[i-1]) // 전전꺼 + 현재, 이전꺼 
        }
    }
    
    
    return max(dp1.max()!,dp2.max()!)
}