let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var acc: [Int] = [Int](repeating: 0, count: n)

acc[0] = arr[0]
for i in 1..<n {
    acc[i] = acc[i-1] + arr[i]
}

var l = 0 ,r = k


var ans = acc[r-1]

while l < n-k {
    
    ans = max(ans,acc[r] - acc[l])
    r += 1
    l += 1
    
    if r == n {
        break
    }

    

    
}
print(ans)
