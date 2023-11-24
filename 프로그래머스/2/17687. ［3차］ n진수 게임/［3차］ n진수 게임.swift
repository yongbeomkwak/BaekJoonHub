func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    // n: 진법
    // t: 구해야할 숫자 갯수
    // m: 참가 인원
    // p: 순서
    // 0110 11 100 101 110 111 1000
    // 0110 11 1
    
    var numbers: [String] = []

    
    var k:Int = 0
    
    let count = t*m
    
    while numbers.count < count { // (진행할 턴 * 인원 수) = 모든 턴이 지낫을 때 말할 숫자의 개수
        numbers += String(k, radix: n).compactMap({ String($0).uppercased() })
        k+=1
    } 
      
    return stride(from: p - 1, to: count, by: m).reduce("", { $0 + numbers[$1] })
}