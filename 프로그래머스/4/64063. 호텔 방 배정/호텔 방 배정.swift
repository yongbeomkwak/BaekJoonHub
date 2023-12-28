import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var result: [Int64] = []
    var dic: [Int64:Int64] = [:]

    for number in room_number {
        let n = dic.getRoomNumber(number)

        result.append(n)
    }
    return result
}

extension Dictionary where Key == Int64, Value == Int64 {
    mutating func getRoomNumber(_ n: Int64) -> Int64{
        guard let s = self[n] else {
            self[n] = n + 1
            return n
        }

        let newRoom = getRoomNumber(s)
        self[n] = newRoom

        return newRoom
    }
}