func split(_ s: String) -> [String] {
    
    var ss: String = ""
    
    var ret:[String] = []
    
    for c in s {
        
        ss += String(c)
        
        
        if ss.count == 2 {
        
            if ss.filter({"a" <= $0 && $0 <= "z"}).count == 2 {
                ret.append(ss)
            }
        
            ss = String(ss.last!)
        }
        
    }
    
    return ret
}

func solution(_ str1:String, _ str2:String) -> Int {
    
    var str1 = str1.lowercased()
    var str2 = str2.lowercased()
    
    let MUL: Double = 65536.0
    
    var listA = split(str1)
    var listB = split(str2)
    
    var countDictA: [String:Double] = [:]
    var countDictB: [String:Double] = [:]
    
    for a in listA {
        countDictA[a] = countDictA[a,default:0]+1
    }
    
     for b in listB {
        countDictB[b] = countDictB[b,default:0]+1
    }
    
    var setA = Set<String>(listA)
    var setB = Set<String>(listB)
    
    var intersection = setA.intersection(setB)
    var union = setA.union(setB)
    
    var i_n: Double = 0
    var u_n: Double = 0
    
    for i in intersection {
        i_n += min(countDictA[i,default:0],countDictB[i,default:0])
    }
    
    for u in union {
        u_n += max(countDictA[u,default:0],countDictB[u,default:0])
    }
    
    if union.count == 0 {
        return Int(MUL)
    }
    


    return  Int(i_n / u_n * MUL)
}