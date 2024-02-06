let n = Int(readLine()!)!

var numbers : [Int] = [Int](repeating: 0, count: n+1)
var dp : [Int] = [Int](repeating: 1, count: n+1) // dp[i] = i까지 최장 증가 부분 수열
 
for i in 1...n {
    numbers[i] = Int(readLine()!)!
}


for i in 2...n {
    
    for j in 1..<i {
        
        if numbers[i] > numbers[j] && dp[i] < dp[j] + 1 {
            dp[i] = dp[j]+1
        }
        
    }
}

print(n-dp.max()!)
