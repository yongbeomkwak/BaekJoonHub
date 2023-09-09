
import Foundation

func solution(_ dartResult:String) -> Int {
    let bounsDict: [Character: Double] = ["S": 1, "D": 2, "T": 3]
    
    var scores:[Int] = .init()
    
    
    var tmpNumber:String = ""
    for c in dartResult { // 숫자
        
        if c.isNumber{
            tmpNumber += String(c) // 숫자 누적 
            continue
        }
        
        else if c == "#" || c == "*" { // 옵션
            
            if c == "#" {
                let tmp = scores.popLast()!
                scores.append(tmp * -1)
            }
            
            else { // * 은 현재 점수와 이전 점수 2 배 
                let tmp1 = scores.popLast() ?? 0 
                let tmp2 = scores.popLast() ?? 0 
                scores.append(tmp2 * 2)
                scores.append(tmp1 * 2)
                
            }
            
        }
        else {  // 문자가 나왔다는 것은 이제 숫자는 마감
            scores.append(Int(tmpNumber)!)  // 숫자 마감
            tmpNumber = ""
            let tmp = scores.popLast()!
            scores.append(Int(pow(Double(tmp),bounsDict[c]!)))
        }
        
    }
    
    
    return scores.reduce(0,+)
}