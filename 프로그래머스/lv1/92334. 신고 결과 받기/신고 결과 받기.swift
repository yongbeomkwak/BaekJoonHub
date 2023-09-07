import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reported: [String: Int] = [:] // 신고횟수
    var user: [String: [String]] = [:] // [신고자, [신고한 인원]]

    for r in Set(report) { // 중복 신고 제외 
        let splited = r.split(separator: " ").map { String($0) } // 스플릿 
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]] // 신고 내역 추가 
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1 // 신고 횟수 증가
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {  // 누적 신고당한 횟수가 k번 이상인 횟수면 신고한 인원에게 그 인원들 출력 
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}