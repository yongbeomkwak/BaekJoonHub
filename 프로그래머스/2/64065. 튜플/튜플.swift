import Foundation

struct Info {
    
    let key:Int // 데이터
    let count:Int // 누적값
    
    init(_ key:Int,_ count:Int){
        self.key = key 
        self.count = count
    }
     
    public static func >= (lhs:Self,rhs:Self) ->Bool { // 내림차순 
        return lhs.count>=rhs.count
    }
    
}

func solution(_ s:String) -> [Int] {
    
    var hash:[Int:Info] = [:]
    var ans:[Int] = []
    
    var num = ""
    
    for c in s {
        if c.isNumber {
            num += String(c)
        }
        else {
            if !num.isEmpty {
                var i = Int(num)!
                let tmp = Info(i,0)
                hash[i] = Info(i,hash[i,default:tmp].count+1)
            }
            num = ""
        }
    }
    
    
    for value in hash.values.sorted(by:>=) { 
        ans.append(value.key)
    }
    
    return ans
}