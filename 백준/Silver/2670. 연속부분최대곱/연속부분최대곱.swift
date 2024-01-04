let n = Int(readLine()!)!

var arr:[Double] = []


for _ in 0..<n {
    arr.append(Double(readLine()!)!)
}
import Foundation

var dp: [Double] = [Double](repeating: .zero, count: n+1)

dp[0] = arr[0]

var ans: Double = .zero
for i in 1..<n {
    
    dp[i] = max(dp[i-1]*arr[i],arr[i]) // 4 째자리에서 반오
    
    ans = max(ans,dp[i])
}

print(String(format:"%.3f", (ans*1000.0).rounded()/1000.0)) // Foundation 임포트 필수  소수점 이하 4 째자리에서 반올림 후 , 소수점 이하 셋째 자리까지 출력


