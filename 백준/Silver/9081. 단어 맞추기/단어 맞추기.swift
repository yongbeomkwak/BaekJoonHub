import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

func nextPermutation<T: Comparable>(_ arr:[T]) -> [T] {
    
    var arr = arr
    var idx: Int = arr.count-1 // 오른쪽 끝부터
    
    while idx > 0 && arr[idx-1] >= arr[idx] { // A[i-1] < A[i] 를 만족하는 가장 큰 인덱스를 찾음
        idx -= 1
    }
    
    // 이미 arr이 가장 마지막 상태 (오름차순 완성)
    if idx <= 0 {

        return arr
    }
        
    var j = arr.count-1
    
    // idx = A[i-1] < A[i] 를 만족하는 가장 큰 인덱스, 즉 idx-1이 실질적으로 j와 바뀔놈
    
    //
    while arr[idx-1] >= arr[j] { // idx-1과 가장 비슷하게 큰 j를 찾음
        j -= 1
    }
    
    arr.swapAt(idx-1, j) // 스왑
    

    // 앞에꺼는 그대로, 뒤에거는 오름차순 정렬
    return Array(arr[0..<idx] + arr[idx..<arr.count].sorted())
}

var tc = Int(readLine()!)!

repeat {
    
    let arr = Array(readLine()!).map{String($0)}
    
    print(nextPermutation(arr).joined())
    
    tc -= 1
} while tc > 0


