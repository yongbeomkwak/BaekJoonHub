let n = Int(readLine()!)!

var map: [[Int]] = [[Int](repeating: 0, count: n+1)]

for _ in 0..<n {
    map.append( [0] + readLine()!.split{$0 == " "}.map{Int($0)!})
}

var dp: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [0,0,0], count: n+1), count: n+1)

// dp[i][j][k] = i j 도달할 때 k ~ (0,1,2) 0 = 가로 , 1 = 세로 , 2 = 대각선

dp[1][2][0] = 1 // (1,2)에서 가로로 시작
for i in 1...n {
    
    if i == 1 { // i가 1 즉 가장 위일 때는 가로 밖에 경우가 없음
        for j in 3...n{
            if map[i][j] == 1 {
                continue
            }
            
            dp[i][j][0] = dp[i][j-1][0]
        }
        continue
    }
    
    for j in 1...n {
        
        if map[i][j] == 1 {
            continue
        }
        
        
        //가로로 도착하려면 이전 j-1일때 가로 또는 대각
        dp[i][j][0] = dp[i][j-1][0] + dp[i][j-1][2]
        
        // 세로로 도착하려면 i-1일때 세로 또는 대각
        dp[i][j][1] = dp[i-1][j][1] + dp[i-1][j][2]
        
        // 대각은 2군데 더 비어있을 때
        if map[i-1][j] == 0 && map[i][j-1] == 0 {
            dp[i][j][2] = dp[i-1][j-1][0] + dp[i-1][j-1][1] + dp[i-1][j-1][2]
        }
        
    }
}

print(dp[n][n].reduce(0, +))
