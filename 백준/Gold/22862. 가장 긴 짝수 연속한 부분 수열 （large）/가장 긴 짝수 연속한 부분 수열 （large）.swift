let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}


var left = 0, right = 0

var ans = 0

var oddCount = 0

while true {
    
    if oddCount > k {
        if arr[left] % 2 == 1 {
            oddCount -= 1
        }
        left += 1
    } else if right == n {
        break
    } else {
        
        if arr[right] % 2 == 1 {
            oddCount += 1
        }
        
        right += 1
    }
    
    if oddCount <= k {
        ans = max(ans,right-left-oddCount)
    }
    
}

print(ans)
