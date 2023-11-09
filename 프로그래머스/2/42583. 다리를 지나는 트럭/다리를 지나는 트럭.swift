import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var waiting_trucks: [Int] = truck_weights
    var cross_trucks: [Int] = []
    var distance: [Int] = []
    var time: Int = 0
    
    let cross =  { distance = distance.map { $0 + 1 } ; time += 1 } // 진행: 각 트럭의 거리 +1 , 전체 시간 +1 
    let depart: (Int) -> () = { cross_trucks.append($0) ; distance.append(1) } // 출발: 건너고 있는 트럭 및 거리 추가  
    
    let arrive = { 
        
        let first = distance.first ?? 0 
       
        if first > bridge_length {
                cross_trucks.removeFirst() 
                distance.removeFirst()  
        }
        
    } // 도착: 건너고 있는 트러믹 및 시간 제거
    
    
    while !waiting_trucks.isEmpty || !cross_trucks.isEmpty {
        
        cross()
        arrive()
     
       
        if let first = waiting_trucks.first  {
        
            if first + cross_trucks.reduce(0,+)  <= weight {
                depart(waiting_trucks.removeFirst())
            }
        }
        
    }
    
    
    
    
    
    return time
}