import Foundation

let n = Int(readLine()!)!

var arr: [Int] = []

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

func quicksort(_ arr: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        // 배열을 분할하고 피벗 위치를 받음
        let pivotIndex = partition(&arr, low, high)
        
        // 피벗을 기준으로 좌우 배열을 재귀적으로 정렬
        quicksort(&arr, low, pivotIndex - 1)  // 피벗보다 작은 부분
        quicksort(&arr, pivotIndex + 1, high) // 피벗보다 큰 부분
    }
}

func partition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
    // 피벗을 배열의 마지막 요소로 설정
    let pivot = arr[high]
    var i = low // 왼쪽에 배치될 공간
    
    for j in low..<high {
        // 현재 요소가 피벗보다 작거나 같으면 i를 증가시키고 교환
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    // 피벗을 중앙 위치로 이동
    arr.swapAt(i, high)
    return i
}


quicksort(&arr, 0, n-1)

arr.forEach {
    print($0)
}
