let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var arr : [Int] = [0]

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var dp = Array(repeating:Array(repeating:Array(repeating:-4000000,count:2),count:m+1),count:n+1)

// dp[i][j][0] = i번째 구간에 j번째 숫자를 포함시키지 않는 경우, dp[i][j-1][0] 또는 dp[i][j-1][1] 최댓값을 선택
// dp[i][j][1] = i번째 구간에 j번째 숫자를 포함시키는 경우 , dp[i][j-1][1] 또는 dp[i-1][j-1][0]


dp[0][0][0] = 0
for i in 1...n {
    
    dp[i][0][0] = 0 // 0번째 구간에서 i를 선택하지 않았을 때
    
    for j in 1...m {
    
        // 이번 j번째 구간에서 i 숫자를 포함하지 않을때는
        // 이전 j번째에서 i-1를 선택하거나 하지 않았을 때
        dp[i][j][0] = max(dp[i-1][j][1],dp[i-1][j][0])
        
        
        // j번째 구간에 i 숫자를 포함했을때는
        // j번째 구간에서 i-1을 선택했을 때
        // j-1번째 구간에서 i-1을 선택하지 않았을 때
        dp[i][j][1] = max(dp[i-1][j][1],dp[i-1][j-1][0])+arr[i]
    }
}

print(max(dp[n][m][0],dp[n][m][1]))
