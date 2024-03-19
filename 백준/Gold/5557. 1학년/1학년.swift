let n = Int(readLine()!)!

var numbers = readLine()!.split{$0 == " "}.map{Int($0)!}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 21), count: n)

dp[0][numbers[0]] = 1

for i in 1..<n {
    
    var now = numbers[i]
    
    for j in 0...20 {
        
        if now <= j {
            
            if dp[i-1][j-now] != 0 {
                dp[i][j] += dp[i-1][j-now] // now를 더할 때
            }
        }
        
        if now+j <= 20 {
            dp[i][j] += dp[i-1][j+now] // now를 뺄 때
        }
        
        
        
        
    }
    
}

print(dp[n-2][numbers[n-1]]) // n-2 까지 써서 n-1을 만들 수 있는 경우의 수
