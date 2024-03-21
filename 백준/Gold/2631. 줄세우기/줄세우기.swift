let n  = Int(readLine()!)!

var arr: [Int] = []

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 1, count: n)

var result: Int =  1

for i in 1..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i],dp[j]+1)
            result = max(result,dp[i])
        }
        
    }
}

print(n-result)
