let n = Int(readLine()!)!

var total = 0

var dist: [Int] = [Int](repeating: 0, count: n*2+1)

for i in 1...n {
    
    let number = Int(readLine()!)!
    
    dist[i] = dist[i-1] + number
    total += number
    
}


var ans = 0

//dist[i] = 1 ~ i+1까지 누적거리
for i in 1...n-1 { // 첫번 째 탑
    
    var a = i
    var b = n
    
    while (a<=b) {
        
        let mid = (a+b)/2 // 두번 째 탑
        
        let clock = dist[mid] - dist[i-1] // i ~ mid+1까지
        let counterClock = total - clock
        
        if clock < counterClock {
            a = mid+1
        } else {
            b = mid-1
        }
        
        ans = max(ans,min(clock,counterClock))
    }
    
}

print(ans)
