import Foundation

let nk = readLine()!.components(separatedBy: " ").map{Int($0)!}

let (n,k) = (nk[0], nk[1])

var coins: [Int] = []

var dp: [Double] = [Double](repeating: 0, count: k+1)



for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

dp[0] = 1

for coin in coins {
    
    if coin > k { continue }
    
    for i in 0...k-coin {
        dp[i+coin] += dp[i]
    }
}

print(Int64(dp[k]))


