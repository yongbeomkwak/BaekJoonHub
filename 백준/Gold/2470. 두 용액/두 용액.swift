let n = Int(readLine()!)!

let liquides : [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}

var ans: (Int,Int,Int) = (0,0,Int.max)

let sorted_list = liquides.sorted()

var left = 0 , right = n-1

while left < right {
    
    if left == n || right == -1 {
        break
    }
    
    let l = sorted_list[left]
    let r = sorted_list[right]
    
    if abs(ans.2) > abs(l+r) {
        ans = (l,r,abs(l+r))
    }
    
    if l+r < 0 {
        left += 1
    } else {
        right -= 1
    }
    
}

print("\(ans.0) \(ans.1)")
