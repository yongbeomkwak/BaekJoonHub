import Foundation

enum Bonus: Character {
    case S = "S"
    case D = "D"
    case T = "T"
    
    func operate(_ n: Int) -> Int {
        
        switch self {
            case .S:
                return n 
            
            case .D:
                return Int(pow(Double(n),2))
            
              case .T:
                return Int(pow(Double(n),3))
        }
        
    }
}

enum Option: Character {
    case star = "*"
    case acha = "#"
    
    func operate(_ n: Int) -> Int {
        
        switch self {
          
            case .star:
                return n*2
            
            case .acha:
                return -n

        }
        
    }
}


func solution(_ dartResult:String) -> Int {
    
    var arr: [Int] = []
    
    var s: String = ""
    for c in dartResult {
        
        if c.isNumber {
            s += String(c)
            continue
        }
        
         let n = Int(s) ?? 0
        print("\(n) \(s)")
         s = ""
        
        if let bonus = Bonus(rawValue:c) {
            arr.append(bonus.operate(n))
            continue
        }
        
        if let option = Option(rawValue:c) {
            
            switch option {
                case .star:  // 스타상은 최대 2개 영향 있을 수 있음
                     if arr.count >= 2{ // 2개 이상일 경우 첫번 째, 두번 째 전 적용

                    let a = option.operate(arr.removeLast())
                    let b = option.operate(arr.removeLast())

                    arr.append(b)
                    arr.append(a)

                } else { // 1개 이하일 경우 1개만 적용
                    arr.append(option.operate(arr.removeLast()))
                }
                
                case .acha: // 아차상은 하나만 
                    arr.append(option.operate(arr.removeLast()))
                
            }
            
           
        
        }
        
        
    }


    return arr.reduce(0,+)
}