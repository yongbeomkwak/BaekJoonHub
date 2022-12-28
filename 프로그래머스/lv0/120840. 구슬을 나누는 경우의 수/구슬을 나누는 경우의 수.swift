import Foundation




func solution(_ balls:Int, _ share:Int) -> Int64 {
    var min = balls - share < share ? balls - share : share

    var answer: Int64 = 1
    if min == 0 { return 1 }
    for i in 1...min {
        answer *= Int64(balls-min+i)
        answer /= Int64(i)
    }
    return answer
}