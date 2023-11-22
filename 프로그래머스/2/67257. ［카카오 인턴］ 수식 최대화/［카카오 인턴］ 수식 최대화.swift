import Foundation


enum Oper: Character {
    case plus = "+"
    case minus = "-"
    case multi = "*"
    
    func calc(_ n1:Int64, _ n2:Int64) -> Int64 {
        
        switch self {
            
            case .plus: 
                return n1+n2
            
            case .minus:
                return n1-n2
            
            case .multi:
                return n1*n2
            
        }
        
    }
}

func operate(_ numbers: [Int64], _ opers:[Character], _ prior: [Oper]) ->Int64 {
    
    var numbers = numbers
    var opers = opers
    for oper in prior {
        while let index = opers.firstIndex(of: oper.rawValue) {
            numbers[index] = oper.calc(numbers[index], numbers[index+1]) // 계산 결과를 왼쪽에 저장
            numbers.remove(at: index+1) // 제거 
            opers.remove(at: index) // 제거 
        }
    }
    
    
    return abs(numbers[0])
}

func solution(_ expression:String) -> Int64 {
    
    var numbers = expression.components(separatedBy: ["*", "+", "-"]).map{abs(Int64($0)!)}
    let opers = Array(expression.filter({ Int(String($0)) == nil}))
    
    let pattern = "+-*"
    
    var ans:Int64 = 0
    
    for p1 in pattern {
        for p2 in pattern {
            let p3 = pattern.filter({$0 != p1 && $0 != p2}).first!
            
            let priorArray = [Oper(rawValue:p1)!,Oper(rawValue:p2)!,Oper(rawValue:p3)!]
            
            
            ans = max(ans, operate(numbers, opers, priorArray))
        }
    }
    
    
    return ans
}