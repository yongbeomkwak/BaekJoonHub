let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

var (n,k) = (nk[0],nk[1])

var points = readLine()!.split{$0 == " "}.map{Int($0)!}

var start: [Int] = []
var end: [Int] = []

var dist = 0


for point in points {
    start.append(dist)
    end.append(dist+point)
    
    dist += point
}

start.sort()
end.sort()


var left = 0
var right = n-1

k = k > dist ? dist - (k-dist) : k

var ans = 0

while left <= right {
    let mid = (left+right)/2
    if start[mid] <= k && k < end[mid]  {
        ans = mid+1
        break
    }
    
    if start[mid] >= k {
        right = mid
        continue
    }
    
    if end[mid] < k {
        left = mid
    }
    
}

print(ans)
