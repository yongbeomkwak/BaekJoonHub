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
    
    var parking:[String:Int] = [:]
    
    var cost:[String:Int] = [:]
    
    for record in records {
        let input = record.split{$0 == " "}.map{String($0)}
        let carNum = input[1]
        let min = timeToMin(input[0])
        
        if input[2] == "IN" {
            
            parking[carNum] = min
            
        } else {
            
            let gap = min - parking[carNum]!
            parking[carNum] = nil
            
            // let finalCost = 
            
            cost[carNum] = cost[carNum,default:0] + gap
        }

    }
    
    parking.forEach { // 아직 출차 하지 않은 차들 
        
        let gap = timeToMin("23:59") - $0.value // 마감시간 - 입차시간
        
        cost[$0.key] = cost[$0.key,default:0] + gap
    }
    
  
    
    func calcFinalCost(_ time:Int) -> Int {
        return (time > baseMin ? baseCost + Int(ceil(Double(time-baseMin)/Double(unitMin))) * unitCost : baseCost) 
    }
    
    cost.forEach{
        cost[$0.key] = calcFinalCost($0.value)
    }
    
    var sortedCar = cost.keys.sorted().map{cost[$0]!}

    return sortedCar
}