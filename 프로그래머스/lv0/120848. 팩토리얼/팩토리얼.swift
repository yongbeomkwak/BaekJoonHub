import Foundation

func fact(_ n:Int) -> Int { 
    
    if(n<=1){
        return 1
    }
    return n * fact(n-1)
                                 
}

func solution(_ n:Int) -> Int {
    
    var ans = 1
    
    for i in 1...10{
        if(fact(i)>n){
            break
        }
        ans = i
    }
    
    return ans
}