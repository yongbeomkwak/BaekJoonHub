let n = Int(readLine()!)!

var tArr: [Int] = [0]
var pArr: [Int] = [0]

var dp: [Int] = [Int](repeating: 0, count: n+2)

for i in 1...n {
    let tp = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (t,p) = (tp[0],tp[1])
    
    tArr.append(t)
    pArr.append(p)
}

var ans = 0

for i in 1...n {
    
    if (i + tArr[i] <= n+1) {
        
        dp[i+tArr[i]] = max(dp[i+tArr[i]],dp[i]+pArr[i])
        
        ans = max(ans,dp[i+tArr[i]])
    }
    
    dp[i+1] = max(dp[i+1],dp[i])
    
    ans = max(ans,dp[i+1])
    
}

print(ans)
