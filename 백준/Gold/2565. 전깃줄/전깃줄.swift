let n = Int(readLine()!)!

var dp =  [Int](repeating: 1, count: n+1)

var lines: [[Int]] = []


for _ in 0..<n {
    let ab = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (a,b) = (ab[0],ab[1])
    
    lines.append([a,b])
}

lines.sort(by: {return $0[0] < $1[0]})

var result: Int = 0

for i in 1..<n {
    for j in 0..<i {
        
        if lines[i][1] > lines[j][1] {
            dp[i] = max(dp[i],dp[j]+1)
        }
        
    }
    
    result = max(result,dp[i])

}


print(n-result)
