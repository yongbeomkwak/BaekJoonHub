let DP = readLine()!.split{$0 == " "}.map({Int($0)!})
let (D,P) = (DP[0],DP[1])

var pipes: [(Int,Int)] = []

for _ in 0..<P {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    pipes.append((input[0],input[1]))
}

var dp = [Int](repeating: 0, count: D+1)

dp[0] = Int.max

for i in 0..<P {
    
    let now = pipes[i]
    
    for j in stride(from:D,through: now.0,by:-1) {
        
        dp[j] = max(dp[j],min(dp[j-now.0],now.1)) // max(이전 결과, 이전 최댓값과 현재 파이프 중 최솟값 )
    }
}
print(dp[D])
