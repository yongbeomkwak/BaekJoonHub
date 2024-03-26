func compare(_ f1: Double,_ f2: Double) -> Bool {
    

    return Double(f2) * 0.9 <= f1
}

let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Double($0)!}.sorted()



var ans: Int = 0


for i in 0..<n-1 { // 0 ~ n-2 까지
    
    var now = -1
    var start = i+1
    var end = n-1
    
    while start <= end {
        
        let mid = (start+end)/2
        let f2 = arr[mid]
        
        if compare(arr[i], f2) {
            
            now = mid
            start = mid+1
            
        } else {
            end = mid-1
        }
        
        
    }
    
    ans += now == -1 ? 0 : now-i
    
}

print(ans)

