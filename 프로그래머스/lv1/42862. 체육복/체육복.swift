import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
     // 가지고 있는 체육복 개수 저장 (기본적으로 1벌)
    var students = [Int](repeating: 1, count: n)
    
    // 잃어버린 사람은 체육복 0벌
    for l in lost {
        students[l-1] = 0
    }
    // 여벌 가져 온 사람은 +1 벌
    for r in reserve {
        students[r-1] += 1
    }
    
    var count = 0 // 체육복을 빌리지 못한 학생 수
    for i in 0..<n {
        if students[i] == 0 {
            if i>0 && students[i-1] > 1 {
                // 앞번호 학생에게 빌린다.
                students[i] = 1
                students[i-1] = 1
            } else if i<n-1 && students[i+1] > 1 {
                // 뒷번호 학생에게 빌린다.
                students[i] = 1
                students[i+1] = 1
            } else {
                // 빌리지 못했다.
                count += 1
            }
        }
    }
    
    return n - count

}