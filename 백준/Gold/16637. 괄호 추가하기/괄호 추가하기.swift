import Foundation

enum Oper: Character {
    case plus = "+"
    case subtract = "-"
    case multi = "*"
    
    
    func calc(_ n1: Int, _ n2: Int) -> Int {
        
        switch self {
            case .plus:
                return n1 + n2
            case .subtract:
                return n1 - n2
            case .multi:
                return n1 * n2
            
        }
        
    }
    
}

let n = Int(readLine()!)!
let s = Array(readLine()!)


var ans: Int = Int.min

func calc(_ index: Int, _ value: Int) {
    
    if index >= n {
        ans = max(ans,value)
        return
    }

    let op1 = index >= 1 ? Oper(rawValue: s[index-1])! : .plus
    
    let n1 = Int(String(s[index]))!
    
    calc(index+2, op1.calc(value, n1))
    
    
    if n-2 > index {
        
        let n2 = Int(String(s[index+2]))!
        
        let op2 =  Oper(rawValue: s[index+1])!
        
        let res1 = op2.calc(n1, n2)
        let res2 = op1.calc(value, res1)
        
        
        calc(index+4,res2)
        
    }
    
    
}

calc(0,0)

print(ans)
