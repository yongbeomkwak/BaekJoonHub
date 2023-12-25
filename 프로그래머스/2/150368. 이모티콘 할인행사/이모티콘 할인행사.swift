import Foundation

func discount(_ cost: Int, _ rate:Int) -> Int {
    
    return Int(Double(cost) / Double(100) * Double(100-rate))
}

func Rpermutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()

    func Rpermut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<elements.count {
            Rpermut(now + [elements[i]])
        }
    }
    Rpermut([])
    return result
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    let discounts: [Int] = [10,20,30,40]
    
    let entire_discounts = Rpermutation(discounts,emoticons.count)
    
    var ans: [Int] = [0,0]
    
    for percents in entire_discounts { // 모든 경우의 수 (중복순열)
        
        var members = 0
        var total_cost = 0
    
       for info in users {
            let prefer_percent = info[0] // 원하는 할인율
            let base_cost = info[1] // 이모티콘 플러스 구매의향 누적 가격
            var purchased: Int = 0
           
            for (percent,cost) in zip(percents,emoticons) { //(해당 이모티콘 할인율,가격)
        
                let real_cost = discount(cost,percent)
                
                if prefer_percent <= percent { // 일정 할인율 이상이면 구매
                
                    // 현재까지 구매 가격 + 지금 이모티콘 가격이   만약 플러스 구매의향 가격 이상이면
                    purchased += real_cost 
                                
                }
                
             }
           
           if purchased >= base_cost { // 플러스 전환 
               members += 1
           } else {
               total_cost += purchased
           }
           
    }
        

        // 판정
        if ans[0] < members { // 플러스 가입자가 최선
            ans[0] = members
            ans[1] = total_cost
        } else if ans[0] == members {
            ans[1] = max(ans[1],total_cost) // 만약 플러스가 같다면 누적금액이 높은 것
        }
    

    }
    
    
    return ans
}
