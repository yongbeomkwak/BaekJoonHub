
var tc = Int(readLine()!)!


while tc != 0 {
    
    let n = Int(readLine()!)!
    
    var board: [[Int]] = []
    
    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+2)  // dp[i][0] = 현재 윗 스티커를 땔 때
    
    for _ in 0..<2 {
        let input = readLine()!.split{$0 == " "}.map({Int($0)!})
        board.append([0,0]+input)
    }
    
    for i in 2..<n+2 {
        
        dp[i][0] = max(dp[i-1][1],dp[i-2][1]) + board[0][i]  // 현재 위에서 땔 때,  바로 직전 아래과 두번 째 직전 아래
        dp[i][1] = max(dp[i-1][0],dp[i-2][0]) + board[1][i] // 현재 아래에서 땔 때 바로 직전 위와 두번 째 직전 위
        
    
    }
    
    print(max(dp[n+1][0],dp[n+1][1])) // 마지막에 2 케이스를 비교
    
    
    tc-=1
}


