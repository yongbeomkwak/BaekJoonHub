
var tc = Int(readLine()!)!

repeat {
    
    let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (n,m) = (nm[0],nm[1])
    
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    
    for i in 1...m {
        dp[1][i] = i
    }
    //dp[i][j] : i번째 숫자가 j일 때 나올 수 있는 개수
    
    for i in stride(from: 2, through: n, by: 1) {
        for j in 1...m {
            dp[i][j] = dp[i][j-1] + dp[i-1][j/2]
        }
    }
    
    print(dp[n][m])
    
    tc -= 1
} while tc > 0
