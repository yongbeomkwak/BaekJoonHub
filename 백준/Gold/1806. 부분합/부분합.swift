import Foundation

let ns = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,s) = (ns[0], ns[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var dist: Int = Int.max

var left: Int = 0
var right: Int = 0

var sum = 0

while left <= right {
    
    if sum >= s {
        dist = min(dist,right-left)
        sum -= arr[left]
        left += 1
    } else if right == n  {
        break
    } else {
        sum += arr[right]
        right += 1
    }
}


print(dist == Int.max ? 0 : dist)


