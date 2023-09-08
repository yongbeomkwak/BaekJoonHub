import Foundation


func isPrime(_ num:Int) -> Bool {
    
    if num == 1 {
        return false
    }
    var flag = true
    
    for i in 2..<Int(sqrt(Double(num)))+1{
        if num % i == 0 {
            flag = false
            break
        }
    }
    
    return flag
    
    
}

func solution(_ n:Int, _ k:Int) -> Int {
    
        
    return String(n,radix:k).split{$0 == "0"}.map{Int($0)!}.filter{isPrime($0)}.count
}