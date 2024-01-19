let n = Int(readLine()!)!
let m = Int(readLine()!)!
let xArr = readLine()!.split{$0 == " "}.map{Int($0)!}

var low: Int = 1
var high: Int = n
var ans = n

outer: while low <= high {
        let mid = (low+high)/2
        var prev:Int = 0
        
        for i in 0..<xArr.count {
            
            if  xArr[i] - mid  <= prev { // 이전 가로등 불빛의 오른쪽 빛 영역까지 도달하나 ??
                prev = xArr[i] + mid
            }
            
            else {
                low = mid+1 // 더 넓은 불빛 필요
                continue outer
            }
        }
    
        if n - prev <= 0 { // 가장 끝 영역까지 이전 불빛의 오른쪽이 도달하면 성공?
            high = mid-1
            ans = min(ans,mid)
        }
    
        else { // 도달하지 않으면
            low = mid+1 // 더 넓은 불빛 필요
        }
        
}
    

print(ans)


