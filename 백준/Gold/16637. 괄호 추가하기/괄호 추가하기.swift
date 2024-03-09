import Foundation


enum Oper : Character {
    
    case plus = "+"
    case minus = "-"
    case mul = "*"
    
    
    func calc(_ n1:Int, _ n2: Int) -> Int {
        
        
        switch self {
            
        case .plus:
            return n1+n2
        case .minus:
            return n1-n2
        case .mul:
            return n1*n2
        }
    }
    
}

let n = Int(readLine()!)!

var result = Int.min

let s = Array(readLine()!)

var a = [1,2,3]

func calc (_ index: Int,_ value: Int) {
    
    if (index >= n) {
        
        result = max(result,value)
        return
    }
    
    let op : Oper = index >= 1 ? Oper(rawValue: s[index-1])!  : .plus
    
    let n1 = Int(String(s[index]))!
    
    calc(index+2, op.calc(value, n1)) // 괄호 씌우지 않고 넘어가는 경우
    
    // index+2 = 다음 숫자 index+1은 연사자이므로
    
    
    if index < n-2 {
        
        
        // 1 + 2 + 3
        // 1 + (2 + 3)
        
        let nextOp = Oper(rawValue: s[index+1])!
        
        let n2 = Int(String(s[index+2]))!
        
        let res1 = nextOp.calc(n1, n2) // (2+3)
        let res2 = op.calc(value, res1) // 1 + 5
        
        calc(index+4, res2)
        
    }
    
}

calc(0, 0)

print(result)
