import Foundation



func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
     var trucks = truck_weights
    var bridge = Array(repeating: 0, count: bridge_length)
    var sec = 0
    var w = 0

    while bridge.isEmpty == false {
        // 1초마다 다리위의 트럭 또는 빈공간은 움직임
        w -= bridge.removeFirst()
        sec += 1

        // 다리에 빈 공간 있으면
        if bridge.count < bridge_length {
            // 다리에 진입 예정인 트럭을 포함한 무게와 다리가 견딜 수 있는 무게를 비교해서
            // 견딜 수 있으면 트럭 진입 시킨다.
            if let t = trucks.first {
                if t + w <= weight  {
                    w += trucks.removeFirst() // 트럭 진입
                    bridge.append(t) // 트럭 진입 완료
                } else {
                    // 견딜 수 업으면 트럭 대기하고 빈공간만 보낸다.
                    bridge.append(0)
                }
            }
        }
    }

    return sec
}