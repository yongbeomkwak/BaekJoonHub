func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    let count = t*m
    var values: [String] = []
    var number = 0
    while values.count < count {
        values += String(number, radix: n).compactMap({ String($0).uppercased() })
        number += 1
    }
    return stride(from: p - 1, to: count, by: m).reduce("", { $0 + values[$1] })
}