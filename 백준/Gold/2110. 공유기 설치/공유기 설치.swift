let (nc) = readLine()!.split{$0 == " "}.map{Int($0)!}

let n = nc[0] , c = nc[1]

var xArr: [Int] = []

for _ in 0..<n {
    xArr.append(Int(readLine()!)!)
}

xArr.sort()

var left = 0 , ans = 0
var right = xArr[n-1]

while left <= right {
    
    let mid =  (left+right)/2
    
    var cnt = 1 // 처음은 공유기 1개 설치
    var prev = xArr[0]
    
    for i in 1..<n {
        
        if (prev+mid) <= xArr[i] { // 이전좌표 + 거리 <= 현재좌표 , 공유기 설치
            prev = xArr[i]
            cnt += 1
        }
    }
    
    if cnt >= c { // 공유기 갯수가 주어진 개수보다 크거나 같으면
        ans = mid
        left = mid+1 // 공유기 개수를 줄이기 위함
    } else {
        right = mid-1 // 공유기 개수를 늘리기 위해
    }
    
}

print(ans)
