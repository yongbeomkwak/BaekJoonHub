

var tc : Int = 3

repeat {
    let n = Int(readLine()!)!
    
    var dp : [Int] = [Int](repeating: 0, count: 100001)
    dp[0] = 1
    
    var target: Int = 0
    
    var coins: [Int:Int] = [:]
    
    for _ in 0..<n {
        let info = readLine()!.split{$0 == " "}.map{Int($0)!}
        
        let (coin,amount) = (info[0],info[1])
        
        target += coin * amount
        
        coins[coin] = amount

    }

    if target%2 != 0 {
        print(0)
        tc -= 1
        continue
    }
    
    target/=2
    
    for (coin,amount) in coins { // (동전,개수)
        for money in stride(from: target, through: coin, by: -1) { // 목표값부터, 동전값까지
            if dp[money-coin] != 0 { // 만약 money-coin을 만들 수 있다면 + coin을 더하면  money를 만들 수 있음
                for j in 0..<amount {
                    if money + coin*j <= target {  // j가 0이면 동전 1개를 사용한 것 money-coin+coin = money
                        dp[money+coin*j] = 1
                    }
                }
            }
        }
    }
    
    print(dp[target])
    tc -= 1
} while tc > 0


