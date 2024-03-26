let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var l = 0 , r = 0

var cnt: Int = 0

if arr[r] == 1 {
    cnt += 1
}


var ans = Int.max

while r < n {
    
    if cnt == k {
        ans = min(ans,r-l+1)
        
        if arr[l] == 1 {
            cnt -= 1
        }
        
        l += 1
    } else {
        r += 1
        
        if r < n && arr[r] == 1 {
            cnt += 1
        }
        
    }
    
}

print(ans == Int.max ? -1 : ans)
