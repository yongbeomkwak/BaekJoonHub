let n = Int(readLine()!)!


var dp = [Int](repeating: 0, count: 10_000_001)

dp[1] = 1
dp[2] = 2

for i in stride(from: 3, to: n+1, by: 1) {
    dp[i] = (dp[i-1]+dp[i-2])%10
}

print(dp[n])
