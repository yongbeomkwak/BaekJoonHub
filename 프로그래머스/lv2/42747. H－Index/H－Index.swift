import Foundation

func solution(_ citations:[Int]) -> Int {
    
    let citations = citations.sorted() { $0 > $1 }
    var result = 0

    for i in 0..<citations.count {
        if i + 1 <= citations[i] {
            result = i + 1
        } else {
            break
        }
    }

    return result
}