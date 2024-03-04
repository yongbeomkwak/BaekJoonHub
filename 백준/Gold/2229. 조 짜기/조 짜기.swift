let n = Int(readLine()!)!

var score = [0] + readLine()!.split{$0 == " "}.map{Int($0)!}

var dp = [Int](repeating: 0, count: n+1)


for i in 1...n {
        
    var maxV = 0 ,minV = 10001
    
    for j in stride(from:i,to:0,by:-1) {
        maxV = max(maxV,score[j])
        minV = min(minV,score[j])
        dp[i] = max(dp[i],maxV-minV + dp[j-1])
    }
    
}

print(dp[n])
