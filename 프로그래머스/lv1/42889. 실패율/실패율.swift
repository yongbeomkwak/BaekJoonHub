import Foundation


func solution(_ N:Int, _ stages:[Int]) -> [Int] {
 //[(스테이지, 실패율)] 저장하기 위한 튜플 배열
    var failRate = [(Int, Double)]()
    //전체 사용자 수
    var total: Double = Double(stages.count)
    //스테이지별 클리어하지 못한 사용자 수 저장하기 위한 배열 생성
    var nonClearArr = Array(repeating: 0, count: N+1)
    for i in stages {
        // index번 째 사용자가 현재 도전중인 stage번호 = i
        nonClearArr[i-1] += 1
    }
    for i in 1...N {
        //클리어하지 못한 사용자 없는 스테이지의 경우 (실패율 0)
        if nonClearArr[i-1] == 0 { failRate.append((i, 0.0)) }
        else {
            // 실패율 
            failRate.append((i, Double(nonClearArr[i-1]) / total))
            //전체 사용자 수에서 다음 스테이지 도달하지 못한 사용자 수 빼주기
            total = total - Double(nonClearArr[i-1])
        }
    }
    //실패율 기준으로 내림차순 정렬 후, 스테이지만 반환하기
    return failRate.sorted(by: { $0.1 > $1.1 }).map{ $0.0 }
}


