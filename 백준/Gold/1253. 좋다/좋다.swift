let n = Int(readLine()!)!

var arr = readLine()!.split{$0 == " "}.map{Int($0)!}


arr.sort()

var ans:Int = 0

for i in 0..<n {
    
    let target = arr[i]
    
    var left = 0
    
    var tmp = Array(arr[0..<i]) + Array(arr[i+1..<n]) // i를 제외한
    
    var right = tmp.count-1 // target이 i 번째 수니깐 right의 끝은 i-1까지
    
    while left < right {
        
        let sum = tmp[left] + tmp[right]
        
        if sum == target {
            ans += 1
            break
        } else if sum > target {
            right -= 1
        } else {
            left += 1
        }
    
    }
    
}

print(ans)
