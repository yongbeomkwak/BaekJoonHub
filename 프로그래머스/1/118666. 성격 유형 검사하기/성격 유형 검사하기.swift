import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var score:[Character:Int] = [:]
    
    
    for i in 0..<choices.count {
        
        let first = survey[i].first!
        let last = survey[i].last!
        
        if choices[i] >= 5 {
            score[last] = score[last,default:0] + choices[i]-4
        }
        
        else if choices[i] <= 3 {
            score[first] = score[first,default:0] + ((choices[i]-4) * -1)
        } 
        
    }
    
    var result: String = ""
    
    
    let category:[String] = ["RT","CF","JM","AN"] // 이미 사전 순 
    
    for i in 0..<4 {
        
        let first = category[i].first!
        let last =  category[i].last!
         // 같으면 첫번째로
        result += score[first,default:0] >= score[last,default:0] ? String(first) : String(last)
    }
    
    return result
}