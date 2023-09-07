import Foundation
 
func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer = [Int]()
    var termDict = [String: Int]()
    let date = getDate(today)
 
    for s in terms {
        let term = s.split{ $0 == " "}.map{String($0)}
 
        termDict[term[0]] = Int(term[1])
    }
    for i in privacies.indices {
        let privacy = privacies[i].split{ $0 == " " }.map{String($0)}
 
        if getDate(privacy[0]) + (termDict[privacy[1]] ?? 0) * 28 <= date {
            answer.append(i + 1)
        }
    }
    return answer
}
 
 
private func getDate(_ today: String) -> Int {
    let date = today.split(separator: ".")
    let year = Int(date[0]) ?? 0
    let month = Int(date[1]) ?? 0
    let day = Int(date[2]) ?? 0
    return (year * 12 * 28) + (month * 28) + day
}