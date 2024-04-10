let tw = readLine()!.split{$0 == " "}.map{Int($0)!}
let (t,w) = (tw[0],tw[1])


// dp[시간][위치][변경횟수]
var dp = Array(repeating:Array(repeating:Array(repeating: 0, count: w+1),count:2),count:t+1)

var arr: [Int] = [0]

for _ in 0..<t {
    arr.append(Int(readLine()!)!)
}


for j in 0...w {
    for i in 1...t {
        
        if j == 0 {
            dp[i][0][j] = dp[i-1][0][j] + (arr[i] == 1 ? 1 : 0)
        } else {
            
            dp[i][0][j]=max(dp[i-1][0][j],dp[i-1][1][j-1]) + (arr[i] == 1 ? 1 : 0)
            dp[i][1][j]=max(dp[i-1][1][j],dp[i-1][0][j-1]) + (arr[i] == 2 ? 1 : 0)
            
            
        }

    }
}

var ans = 0


for i in 0..<2 {
    for j in 0...w {
        ans = max(ans,dp[t][i][j])
    }
}

print(ans)
