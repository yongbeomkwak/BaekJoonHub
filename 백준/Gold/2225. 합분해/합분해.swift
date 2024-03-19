let DIV =  1000000000

let ab = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (ab[0],ab[1])


var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 201), count: 201)

for i in 0...200 {
    dp[i][0] = 1
}



for i in 1...k {
    for j in 1...n {
        for p in 0...j {
            dp[i][j] += dp[i-1][j-p]
            dp[i][j] %= DIV
        }
    }
}

print(dp[k][n])
