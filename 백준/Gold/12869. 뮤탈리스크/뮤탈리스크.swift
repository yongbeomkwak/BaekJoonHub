let n = Int(readLine()!)!
let scv = readLine()!.split{$0 == " "}.map{Int($0)!} + [0,0]

let damageArr = [1,3,9]

var comb: [[Int]] = []

for i in 0..<3 {
    for j in 0..<3 {
        for k in 0..<3 {
            
            if i != j && i != k && j != k {
                comb.append([damageArr[i],damageArr[j],damageArr[k]])
            }
        }
    }
}

var dp = Array(repeating:Array(repeating:Array(repeating:-1, count: 61),count: 61),count:61)

dp[scv[0]][scv[1]][scv[2]] = 0

for scv1 in stride(from: scv[0], to: -1, by: -1) {
    for scv2 in stride(from: scv[1], to: -1, by: -1) {
        for scv3 in stride(from: scv[2], to: -1, by: -1) {
            
            if dp[scv1][scv2][scv3] == -1 {
                continue
            }
            
            for d in 0..<6 {
                
                let i = scv1 - comb[d][0] >= 0 ? scv1 - comb[d][0] : 0
                let j = scv2 - comb[d][1] >= 0 ? scv2 - comb[d][1] : 0
                let k = scv3 - comb[d][2] >= 0 ? scv3 - comb[d][2] : 0
                
                if dp[i][j][k] == -1 {
                    dp[i][j][k] = dp[scv1][scv2][scv3]+1
                } else {
                    
                    dp[i][j][k] = min(dp[scv1][scv2][scv3]+1,dp[i][j][k])
                    
                }
 
            }
            
            
            
        }
    }
}


print(dp[0][0][0])
