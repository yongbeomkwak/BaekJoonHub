let hw = readLine()!.split{$0 == " "}.map{Int($0)!}

let (h,w) = (hw[0],hw[1])

var blocksH = readLine()!.split{$0 == " "}.map{Int($0)!}


var ans: Int = 0

for i in 1..<w {
    
    var lMax = blocksH[i] , rMax = blocksH[i]
    for j in 0..<i { // 왼쪽 최댓값
        lMax = max(lMax,blocksH[j])
    }
    
    for j in stride(from: i+1, to: w, by: 1) {
        rMax = max(rMax,blocksH[j])
    }
    
    // 두개 중 최솟값이 쌓이는 높이 - 현재 블럭 높이 = 쌓이는 물의양
    ans += min(lMax,rMax) - blocksH[i]
}

print(ans)
