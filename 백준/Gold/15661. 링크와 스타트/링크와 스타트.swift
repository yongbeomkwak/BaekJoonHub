let n = Int(readLine()!)!

var s: [[Int]] = []

for _ in 0..<n {
    s.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var set  = Set(Array(0..<n))

var ans = Int.max

func calc(_ arr1: [Int], _ arr2: [Int]) -> Int {
    
    var sum1 = 0
    var sum2 = 0
    
    for i in 0..<arr1.count {
        
        let n1 = arr1[i]
        
        for j in stride(from: i+1, to: arr1.count, by: 1) {
            
            let n2 = arr1[j]
            
            sum1 += s[n1][n2] + s[n2][n1]
        }
    }
    
    for i in 0..<arr2.count {
        
        let n1 = arr2[i]
        
        for j in stride(from: i+1, to: arr2.count, by: 1) {
            
            let n2 = arr2[j]
            
            sum2 += s[n1][n2] + s[n2][n1]
        }
    }
    
    return abs(sum1-sum2)
}

func dfs(_ index: Int, _ now : [Int] ,_ limitLength: Int) {
    
    if now.count == limitLength {
        
        let startTeam = now
        let linkTeam = Array(set.subtracting(Set(now)))
        
        ans = min(ans,calc(startTeam, linkTeam))
        
        return
    }
    
    for i in index..<n {
        dfs(i+1, now + [i], limitLength)
    }
    
}


for i in 1...n/2 { // 최대 절반까지
    dfs(0, [], i)
}

print(ans)


