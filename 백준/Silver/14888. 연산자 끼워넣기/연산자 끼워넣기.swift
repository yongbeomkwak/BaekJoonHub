let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var opers = readLine()!.split{$0 == " "}.map{Int($0)!}

let limit = opers.reduce(0, +)

var maxValue: Int = Int.min
var minValue: Int = Int.max


enum Oper: Int {
    
    case add = 0
    case sub = 1
    case mul = 2
    case div = 3
    
    func calc(_ n1: Int,_ n2:Int) -> Int {
        switch self {
            
        case .add:
            return n1+n2
        case .sub:
            return n1-n2
        case .mul:
            return n1*n2
        case .div:
            return n1/n2
        }
    }
}

func dfs(_ depth: Int,_ now:Int) {
    
    if depth > limit {
        
        maxValue = max(maxValue,now)
        minValue = min(minValue,now)
        
        return
    }
    
    
    for i in 0..<4 {
        if opers[i] == 0 {
            continue
        }
        
        opers[i] -= 1
        
        let oper = Oper(rawValue: i)!
        
        let n2 = arr[depth]
        
        dfs(depth+1,oper.calc(now, n2))
        opers[i] += 1
    }

}

dfs(1, arr[0])

print(maxValue)
print(minValue)
