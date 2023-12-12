import Foundation

func isPrime(_ n: Int) -> Bool {
    
    if n == 1 {
        return false 
    }
    
    if n < 4 {
        return true 
    }
    
    let end = Int(sqrt(Double(n)))
    
    for i in 2...end {
        if (n%i) == 0 {
            return false 
        }
    }
    
    
    
    return true 
    
}

func solution(_ n:Int, _ k:Int) -> Int {
    
    var list = String(n,radix:k).split{$0 == "0"}.map{Int($0)!}
    
    var ans:Int = 0
    
    print(list)
    for i in list {
        if isPrime(i) {
            ans += 1
        }    
    }
    
    return ans
}