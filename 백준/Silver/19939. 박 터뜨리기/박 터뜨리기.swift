let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

let sum = ((k+1)*k)/2 // 1 ...k 까지 바구니에 공을 깔아 둠

if n < sum {
    print(-1)
} else {
    let remain = n-sum // 깔고 남은 공
    print( remain%k == 0 ? k-1 : k)
    // 만약깔고 남은 공이 k로 나눠 떨어지면 그 몫 만큼 바구니에 각 각 넣어줌 , 차이는 여전히 k-1,
    // 만약 안떨어지면 공의 개수가 많은 쪽부터 적은 순으로 하나씩 추가 , 그러면 차이는  k+1 -1 이므로 = k
}

// 1 2 3

