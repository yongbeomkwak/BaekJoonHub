let n = Int(readLine()!)!
var arr = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted()

var ans: Int = 0

func lowerBound(_ arr: [Int], _ x: Int) -> Int {
  var start = 0
  var end = arr.count - 1
  
  while (start < end) {
    let mid = (start + end) / 2
    if arr[mid] >= x { end = mid }
    else { start = mid + 1}
  }

  return end
}

func upperBound(_ arr: [Int], _ x: Int) -> Int {
  var start = 0
  var end = arr.count - 1
  
  while (start < end) {
    let mid = (start + end) / 2
    if arr[mid] > x { end = mid }
    else { start = mid + 1}
  }

  return end
}

for i in stride(from:0,to: n-2,by:1) {
    let n1 = arr[i]
    var left = i+1
    var right = n-1
    
    while left < right {
        
        let n2 = arr[left]
        let n3 = arr[right]
        
        let sum = n1 + n2 + n3
        
        if sum > 0 {
            right -= 1
        } else {
            
            if sum == 0 {
                
                if arr[left] == arr[right] {
                    ans += right - left
                } else {
                    
                    
                    let idx = lowerBound(arr, arr[right])
                    ans += right-idx+1
                    
                }
                
            }
            
            left += 1
            
        }
        
    }
}

print(ans)
