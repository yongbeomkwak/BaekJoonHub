var tc = Int(readLine()!)!


let DIV = 1_000_000_007

var dp : [Int] = [Int](repeating: 0, count: 5001)

dp[0] = 1

for target in stride(from:2,through: 5000,by:2) {
   
    for i in stride(from:2,through: target,by:2) {
        
        
        dp[target] += dp[i-2] * dp[target-i]
        dp[target] %= DIV
    }
    
    
}

repeat {

    let n = Int(readLine()!)!
    
    print(dp[n])
    
    
    tc -= 1
} while tc > 0
