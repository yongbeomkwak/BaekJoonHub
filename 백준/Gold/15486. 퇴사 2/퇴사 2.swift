let n = Int(readLine()!)!


var arr : [(Int,Int)] = [(0,0)]

for _ in 0..<n {
    
    let input = readLine()!.split{ $0 == " " }.map{Int($0)!}
    
    arr.append((input[0],input[1]))
}

var dp: [Int] = [Int](repeating: 0, count: n+1)


for i in 1...n {
    
    dp[i] = max(dp[i],dp[i-1]) // 바로 전날과 현재 비교 한 후
    
    let finDate = i+arr[i].0-1 // 현재 날짜 + 걸리는시간 -1(오늘제외) = 다음 일 가능한 시간
    
    if finDate <= n { // bottom - top
        dp[finDate] = max(dp[finDate], dp[i-1]+arr[i].1)
    }
    
}


print(dp[n])
