let ns = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n, s) = (ns[0],ns[1])

var arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var l = Int.max

var left = 0 , right = 0 , sum = 0

while left <= right  {
    
    if sum >= s {
        
        l = min(l,right-left)
        sum -= arr[left]
        left += 1 // left를 오른쪽으로 한칸 옮김
        
    } else if right == n {
        break
    } else { // 아직 s보다 작을 때
        
        sum += arr[right]
        right += 1
        
    }
    
}

print(l == Int.max ? 0 : l)
    



