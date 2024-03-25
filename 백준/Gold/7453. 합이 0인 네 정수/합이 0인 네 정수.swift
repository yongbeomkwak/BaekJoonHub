let n = Int(readLine()!)!

var a: [Int] = []
var b: [Int] = []
var c: [Int] = []
var d: [Int] = []

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    a.append(input[0])
    b.append(input[1])
    c.append(input[2])
    d.append(input[3])
}


var ab : [Int] = []
var cd : [Int] = []

for i in 0..<n {
    for j in 0..<n {
        ab.append(a[i]+b[j])
        cd.append(c[i]+d[j])
    }
}

ab.sort()
cd.sort()

var i = 0
var j = cd.count-1
var ans = 0

while i < ab.count && j >= 0  {
    
    let n1 = ab[i]
    let n2 = cd[j]
    
    let sum = n1+n2
    
    if sum == 0  {
        var nextI = i+1
        var nextJ = j-1
        
        while nextI < ab.count && ab[i] == ab[nextI] {
            nextI += 1
        }
        
        while nextJ >= 0 && cd[j] == cd[nextJ] {
            nextJ -= 1
        }
        
        ans += (nextI - i) * (j - nextJ)
        i = nextI
        j = nextJ
        
        
    } else if sum > 0 { // sum이 0보다 크다는 건 ab의 절댓값보다 cd가 크므로 j를 왼쪽으로
        
        j -= 1
        
    } else {
        i += 1
    }
    
}

print(ans)



