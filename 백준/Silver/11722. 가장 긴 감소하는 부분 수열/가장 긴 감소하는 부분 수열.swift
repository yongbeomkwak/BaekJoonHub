import Foundation

let n = Int(readLine()!)!

let arr = [-1] + readLine()!.components(separatedBy: " ").map{Int($0)!}
 
var dp: [Int] = [Int](repeating: 0, count: n+1) // dp[i] = arr[i] 전 까지 가장 긴 감소하는 수열

var ans: Int = 0

for i in 1...n {
    for j in 1..<i {
        if arr[i] < arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
            ans = max(ans, dp[i])
        }
    }
}

print(ans+1) // 자신을 길이에 추가
