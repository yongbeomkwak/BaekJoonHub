import Foundation

var tc = Int(readLine()!)!

repeat {
    
    let n = Int(readLine()!)!
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: 2)
    
    var arr :[[Int]] = []
    
    for _ in 0..<2 {
        arr.append([0] + readLine()!.split{$0 == " "}.map{Int($0)!})
    }
    
    for i in 1...n {
        
        dp[0][i] = max(dp[1][i-1] , ( i > 1 ? max(dp[0][i-2],dp[1][i-2]) : 0)) + arr[0][i]
        dp[1][i] = max(dp[0][i-1] , ( i > 1 ? max(dp[0][i-2],dp[1][i-2]) : 0)) + arr[1][i]
    }
    
    print(max(dp[0][n],dp[1][n]))
    
    
    tc -= 1
} while tc > 0
