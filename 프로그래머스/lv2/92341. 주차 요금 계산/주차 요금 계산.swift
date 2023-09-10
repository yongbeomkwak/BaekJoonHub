import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var timeDict: Dictionary<String, Int> = [:] // 시간 기록 
    var parkingLot: Dictionary<String, String> = [:] //
    records.forEach {
        let map = $0.split(separator: " ").map{ String($0) }
        if parkingLot[map[1]] == nil { //현재 입차 안되어 있으면 
            parkingLot[map[1]] = map[0] // 입차 [차번호:시간]
        } else { // 없으면 출차 
            timeDict[map[1], default: 0] += parkTime(in: parkingLot[map[1]]!, out: map[0]) 
            // 주차 시간 기록 
            parkingLot[map[1]] = nil // 출차 
        }
    }
    parkingLot.forEach { // 아직 출차하지 않은 차 출차 

        timeDict[$0.key, default: 0] += parkTime(in: $0.value, out: "23:59")
    }
    var cars: [String] = []
    records.forEach { // 차 번호만 추출
        let carNumber = $0.split(separator: " ").map{ String($0) }[1]
        if !cars.contains(carNumber) { cars.append(carNumber) }
    }

    return cars.sorted(by: <).map {
        return fee(time: timeDict[$0]!, fees: fees)
    }
}

private func parkTime(in entrance: String, out exit: String) -> Int {
    let inTime = entrance.split(separator: ":").map{ String($0) }.reduce(0){ $0 * 60 + Int($1)! }
    let outTime = exit.split(separator: ":").map{ String($0) }.reduce(0){ $0 * 60 + Int($1)! }
    return outTime - inTime
}

private func fee(time: Int, fees: [Int]) -> Int {
    return time <= fees[0] ? fees[1] : fees[1] + Int(ceil(Double(time - fees[0])/Double(fees[2])) * Double(fees[3]))
}
