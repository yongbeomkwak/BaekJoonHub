var tc = Int(readLine()!)!

repeat {
    
    var n = Int(readLine()!)!
    
    var arr = Array(1...n)
    
    var answer: [String] = []
    
    
    func dfs(_ depth: Int,_ numbers:[Int],_ oper : [String]) {
        
        if depth == n {
           
            var tmpNumber = numbers
            var tmpOper = oper
            
            
            //print("\(tmpNumber) \(tmpOper) #########")
            
            while tmpOper.contains(" ") { // 여백을 하나의 숫자로 묶음
                
                var index = tmpOper.firstIndex(of: " ")!
                
                var n1 = tmpNumber[index]
                var n2 = tmpNumber[index+1]
                
                tmpNumber[index] = n1*10+n2
                tmpNumber.remove(at: index+1)
                tmpOper.remove(at: index)
                
            }
            
            var total = tmpNumber[0]
            
            
            for i in 0..<tmpOper.count {
                
                if tmpOper[i] == "+" {
                    total += tmpNumber[i+1]
                } else {
                    total -= tmpNumber[i+1]
                }
                
            }
            
            
            var oper = oper + [""]
            
            if total == 0 {
                
                var result :[String] = []
                
                for (n,o) in zip(numbers,oper) {
                    result.append("\(n)\(o)")
                }
                
                
                answer.append(result.joined())
            }
            
            
            
            return
        }
        
        for i in 0..<3 {
            
            if i == 0 { // 공백
                
                dfs(depth+1, numbers+[depth+1], oper+[" "])
                
            } else if i == 1 { // +
                
                dfs(depth+1, numbers+[depth+1], oper+["+"])
                
            } else { // -
                
                dfs(depth+1, numbers+[depth+1], oper+["-"])
            }
            
        }
        
        
    }
    
    dfs(1, [1], [])
    
    for ans in answer {
        print(ans)
    }
    
    if tc != 1 {
        print() // 공백
    }
    
    
    
    
    tc -= 1
} while tc > 0



