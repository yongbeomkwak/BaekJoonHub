import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if number == N {
        return 1
    }
    
    var ans = -1
    var dp:[Set<Int>] = [Set([0]),Set([N])]
    
    
    for k in 2...8{
        
        var candidate:[Int] =  [Int(String(repeating:String(N),count:k))!]
        
        for i in 1..<k {
            for j in 1..<k {
                
                if i + j != k {
                    continue
                }
                
                for n1 in dp[i] {
                    
                    for n2 in dp[j] {
                        
                        candidate.append(n1+n2)
                        
                        candidate.append(n1 - n2)
                        
                        candidate.append(n1 * n2)
                       
                        if n1 != 0 {
                            candidate.append(n2 / n1)
                        }
                        
                        if n2 != 0 {
                            candidate.append(n1 / n2)
                        }
                        
                    }
                }
                
            }
        }
        
        let setCandidate = Set(candidate)
        
        dp.append(setCandidate)
        if candidate.contains(number) {
            
            ans = k
            
            return ans
        }
        
    }
    
    
    return -1
}