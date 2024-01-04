
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

let r = arr[0]-1 , c = arr[1]-1, w = arr[2]

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)


dp[0][0] = 1
for i in 1...30 {
    
    dp[i][0] = 1
    dp[i][i] = 1
    for j in 1...30 {

        dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
        
    }
}

// nCr = n-1Cr-1 + n-1Cr
// 3C2 = 2C1 + 2C2 = 2 + 1

var ans: Int = 0

let h = r+w

for i in r..<h {
    for j in c...c+(i-r) {
        ans += dp[i][j]
    }
}

print(ans)
