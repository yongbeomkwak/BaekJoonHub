import Foundation

let nc = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,c) = (nc[0], nc[1])

let weights: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}

var sumArray1: [Int] = []
var sumArray2: [Int] = []

func dfs(from i: Int , to j: Int, array: inout [Int], weight: Int) {

    if weight > c  { // 무게 초과 조합 실패
        return
    }
    
    if i == j { // 목표 도달 시 종료
        array.append(weight)
        return
    }
    
    // 해당 무게를 골랐을 때랑 고르지 않을 때 , 두 갈림길로 분기
    dfs(from: i+1, to: j, array: &array, weight: weight+weights[i])
    dfs(from: i+1, to: j, array: &array, weight: weight)
    
}

dfs(from: 0, to: n/2, array: &sumArray1, weight: 0)
dfs(from: n/2, to: n, array: &sumArray2, weight: 0)

sumArray1.sort()

func bsUpperbound(arr: [Int], target: Int) -> Int {
    
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start+end) / 2
        
        if arr[mid] > target { end = mid }
        else { start = mid + 1}
        
    }
    
    return end
}

var ans: Int = 0

for sum2 in sumArray2 {
    ans += bsUpperbound(arr: sumArray1, target: c-sum2) // sum2를 가방에 담고 남은 공간을 sumArray1 조합으로 채워야하므로  c-sum2
}
print(ans)
