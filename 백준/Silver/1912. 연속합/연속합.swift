
let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map({Int($0)!})

var dp: [Int] = [Int](repeating: 1, count: n+1)


dp[0] = arr[0]

var ans = dp[0]

for i in 1..<n {
    
    dp[i] = max(dp[i-1] + arr[i], arr[i])
    
    ans = max(dp[i],ans)
}

print(ans)
