var t = Int(readLine()!)!

while t != 0 {

    var n = Int(readLine()!)!
    
    var arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    dp[0] = arr[0]
    var ans: Int = dp[0]
    
    for i in 1..<n {
        dp[i] = max(dp[i-1]+arr[i],arr[i])
        ans = max(ans,dp[i])
    }
    
    print(ans)
    
    t -= 1
}
