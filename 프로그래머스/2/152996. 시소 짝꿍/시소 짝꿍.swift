import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    // 2 , 3 , 4
    
    var counter: [Double:Int64] = [:]
    
    var weights = weights.map{Double($0)}
    
    for w in weights {
        counter[w,default:0] += 1         
    }
    
    // 1:1
    var answer: Int64 = counter.values.filter{$0 >= 2}.map{ ($0 * ($0-1))/2 }.reduce(0,+)
    
    var Setweights = Set(weights)
    
    
    // 2:3, 2:4 , 3:4 
    for w in Setweights {
        
         answer += counter[2*w/3,default:0] * counter[w,default:0]
         answer += counter[2*w/4,default:0] * counter[w,default:0]
         answer += counter[3*w/4,default:0] * counter[w,default:0]
        
    }
    
    
    
    return answer
}