enum Operation : Int {
    
    case plus =  0
    case minus  = 1
    case multi = 2
    case div = 3
    
    
    func calc(_ n1:Int,_ n2: Int) -> Int {
        
        switch self {
            case .plus:
                return n1+n2
            case .minus:
                return n1-n2
            case .multi:
                return n1*n2
            case .div:
                return n1/n2
        }
        
    }
    
}


let n = Int(readLine()!)!

let numbers = readLine()!.split{$0 == " "}.map{Int($0)!}
var opers = readLine()!.split{$0 == " "}.map{Int($0)!} // +,-,*,/

var maxV : Int = Int.min
var minV : Int = Int.max

func dfs(_ index: Int ,_ now: Int) {
    
    if index >= n {
        maxV = max(maxV,now)
        minV = min(minV,now)
        return
    }
    
    
    
    for i in 0..<4 {
        
        if opers[i] > 0 {
            
            opers[i] -= 1
            dfs(index+1, Operation(rawValue:i)!.calc(now, numbers[index]))
            opers[i] += 1
            
        }
        
        
    }

}

dfs(1, numbers[0])

print(maxV)
print(minV)
