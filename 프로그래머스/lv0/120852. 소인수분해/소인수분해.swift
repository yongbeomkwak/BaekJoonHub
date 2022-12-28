import Foundation

let isPrime:(Int) -> Bool = { (n:Int) in
    
    if(n<=3)
    {
        return true
    }
    
    for i in (2..<n){
        if(n%i == 0)
        {
            return false
        }
    }
                             
    return true
    
    
}


func solution(_ n:Int) -> [Int] {
    
    var s:Set<Int> = Set<Int>()
    
    var nn = n 
    
    while(nn > 1)
    {
        for i in (2...nn)
        {
            if(isPrime(i) && (nn%i) == 0)
            {
                s.insert(i)
                nn /= i 
                break
            }
        }
    }
    
    
    return s.sorted()
}