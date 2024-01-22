let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (input[0],input[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}


var ans: Int = 0

var cnt: [Int] = [Int](repeating: 0, count: 100001)



var left = 0 , right = 0


while left <= right , right < n {
    
    let l = arr[left] , r = arr[right]
    
    
    if cnt[r] < k { // 오른쪽으로 가면서 k보다 클 때까지 계속 이동
        cnt[r] += 1
        right += 1
    } else { // k보다 커자면
 
        cnt[l] -= 1 // 이후 left에서 빼내면서
        
        left += 1 // 이동
    }
    ans = max(right-left,ans) // 현재 기준 길이를 일단 비교
}

print(ans)
