import Foundation

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

struct Result: Comparable {
    
    let emotionPlus: Int 
    let sales: Int 
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        
        if lhs.emotionPlus == rhs.emotionPlus {
            return lhs.sales < rhs.sales
        }
        
        return lhs.emotionPlus < rhs.emotionPlus
    }
}

func discount(_ cost: Int,_ percent: Int) -> Int {
    return (cost * (100 - percent)) / 100
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    var result: Result = Result(emotionPlus: 0, sales: 0)
    
    let discountPermu = Rpermutation([10, 20, 30, 40], emoticons.count)
    
    for percents in discountPermu {
        
        var emotionPlusCount: Int = 0
        var totalSales: Int = 0
        
        for user in users {

            let preferPercent: Int = user[0]
            let emotionPlusGoalCost: Int = user[1]
            var overTheGoal: Bool = false
            var sales: Int = 0
            
            for (cost, percent) in zip(emoticons, percents) {
            

                if preferPercent > percent { continue }

                let discountedCost: Int = discount(cost, percent)
                sales += discountedCost
              
                if sales >= emotionPlusGoalCost {
                    overTheGoal = true 
                    break
                }

            }
            
            
            if overTheGoal {
                emotionPlusCount += 1
            } else {
                totalSales += sales
            }
        }
        
        let newResult: Result = Result(emotionPlus: emotionPlusCount, sales: totalSales)
        
        result = max(result, newResult)

    }
    
    return [result.emotionPlus, result.sales]
}