var t = Int(readLine()!)!
let n = Int(readLine()!)!

var coins: [(Int,Int)] = []



for _ in 0..<n {
    let ca = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    coins.append((ca[0],ca[1]))
    
}

var dp = [Int](repeating: 0, count: t+1)

dp[0] = 1

for (coin,amount) in coins{
    
    for money in stride(from: t, to: 0, by: -1) {
        
        for i in 1...amount {
            
            if money - (coin*i) >= 0 {
                dp[money] += dp[money-coin*i]
            }
            
        }
        
    }

}

print(dp[t])

