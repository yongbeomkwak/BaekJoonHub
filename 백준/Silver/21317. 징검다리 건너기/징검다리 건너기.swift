
let n = Int(readLine()!)!

var stones: [(Int,Int)] = []

for i in 0..<n-1 {
    
    let input = readLine()!.split{$0 == " "}.compactMap({Int($0)!})
    
    let jump = (input[0],input[1])
    
    stones.append(jump)
}

let k = Int(readLine()!)!

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: 2), count: n+4)

dp[1][0] = 0
dp[1][1] = 0

for i in 1..<n {

    let superJump = i + 3
    let smallJump = i + 1 , small_cost = stones[i-1].0
    let bigJump = i + 2 , big_cost = stones[i-1].1

    for j in 0..<2 {
        dp[i+1][j] = min(dp[i+1][j], dp[i][j]+small_cost)
        dp[i+2][j] = min(dp[i+2][j], dp[i][j]+big_cost)
    }
    
    dp[i+3][1] = min(dp[i+3][1], dp[i][0]+k)
}

print(dp[n].min()!)
