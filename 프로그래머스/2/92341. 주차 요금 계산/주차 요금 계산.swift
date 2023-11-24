import Foundation


func timeToMin (_ time: String) -> Int {

    let time = time.split{$0 == ":"}.map{Int($0)!}
    return time[0]*60 + time[1]
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let baseMin = fees[0]
    let baseCost = fees[1]
    let unitMin = fees[2]
    let unitCost = fees[3]
    
    var ans: [Int] = []
    
    var parking:[String:Int] = [:] // [차번호: 입차시간]
    
    var cost:[String:Int] = [:] // [차번호: 최종 누적 시간]
    
    for record in records {
        let input = record.split{$0 == " "}.map{String($0)}
        let carNum = input[1]
        let min = timeToMin(input[0])
        
        if input[2] == "IN" { // 입차
            
            parking[carNum] = min
            
        } else {
            
            let gap = min - parking[carNum]! // 주차시간 
            parking[carNum] = nil //출차
        
            
            cost[carNum] = cost[carNum,default:0] + gap // 누적
        }

    }
    
    parking.forEach { // 아직 출차 하지 않은 차들 
        
        let gap = timeToMin("23:59") - $0.value // 마감시간 - 입차시간 = 주차시간
        
        cost[$0.key] = cost[$0.key,default:0] + gap  // 누적
    }
    
  
    
    func calcFinalCost(_ time:Int) -> Int {
        return (time > baseMin ? baseCost + Int(ceil(Double(time-baseMin)/Double(unitMin))) * unitCost : baseCost)  
        
        // 기본 시간보다 크면 , 기본 요금 + (올림 처리 * 단위요금) , 그렇지 않으면 기본 요금만
    }
    
    cost.forEach{
        cost[$0.key] = calcFinalCost($0.value) // 누적시간을 최종 금액으로 변환 
    }
    
    var sortedCar = cost.keys.sorted().map{cost[$0]!} // 차 번호로 정렬 후 해당 금액 추출

    return sortedCar
}
