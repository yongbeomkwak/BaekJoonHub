let cn = readLine()!.split{$0 == " "}.map{Int($0)!}

let (c,n) = (cn[0],cn[1])

var arr: [(cost:Int, customer:Int)] = []

var dp: [Int] = [Int](repeating: 200000, count: c+101) // dp[i] = i 명을 모을 때 최소 비용

for _ in 0..<n {
    let info = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    arr.append((info[0],info[1]))

}


dp[0] = 0


for i in 1...c+100 {
    
    for (cost,customer) in arr {
        
        if customer <= i {
            dp[i] = min(dp[i],dp[i-customer] + cost)
        }
    }
    
}

print(dp[c...c+100].min()!) //적어도 c명
