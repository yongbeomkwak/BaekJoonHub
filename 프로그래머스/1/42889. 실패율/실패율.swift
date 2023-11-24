import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var array = Array<Int>(repeating: 0, count: N)
    stages.filter { $0 <= N }.forEach { array[$0 - 1] += 1 }

 

    
  return array.reduce(([Double](),stages.count)){ (info,loser) in
        
        var newRecord = info.0
        let challenger = info.1
        let failRate = Double(loser)/Double(challenger)
        
                                       
                                             
        return (newRecord+[failRate],challenger-loser)
    } // 실패율 계산
    .0 // 실패율 
    .enumerated() // (실패율,인덱스)
    .sorted(by:{ //실패율 높은 순으로 정렬
        $0.element > $1.element
    })
    .map{$0.offset+1} // stage는 0번이 아닌 1번부터 시작이므로 index+1 
    
   
}