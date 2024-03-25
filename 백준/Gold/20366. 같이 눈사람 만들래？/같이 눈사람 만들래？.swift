let n = Int(readLine()!)!

let h = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted()

var ans = Int.max

for i1 in stride(from: 0, through: n-4, by: 1) {
    
    for i2 in stride(from: n-1, through:i1+3, by: -1) {
        
        var j1 = i1+1
        var j2 = i2-1
        
        let h1 = h[i1]
        let h2 = h[i2]

        

        
        while j1 < j2 {
            
            let h3 = h[j1]
            let h4 = h[j2]
            
            ans = min(ans,abs((h1+h2)-(h3+h4)))
            
            if (h1+h2) > (h3+h4) { // 만약 h1+h2가 크면 j1을 우측으로
                j1 += 1
            } else { // 작거나 같으면 j2를 좌측으로
                j2 -= 1
            }
        
        }
        
        
        
    }
}

print(ans)
