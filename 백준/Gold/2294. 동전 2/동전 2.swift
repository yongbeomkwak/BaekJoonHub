let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,k) = (nk[0],nk[1])

var coins: [Int] = []

var dp: [Int] = [Int](repeating: Int.max, count: 100001)

for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

dp[0] = 0


for coin in coins {
    for i in stride(from: coin, to: k+1, by: 1) {
        if dp[i-coin] == Int.max {
            continue
        }
        
        dp[i] = min(dp[i],dp[i-coin]+1)
    }
}


print(dp[k] == Int.max ? -1 : dp[k])
