import Foundation

extension String {
    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ s:String) -> [Int] {
    
    var num: String = ""

    var hash: [Int:Int] = [:] // 숫자:횟수
    
    for c in s {
        if c.isNumber {
            num += String(c)
        } else {
            if !num.isEmpty {
                var i_num = Int(num)!            
                hash[i_num] = hash[i_num,default:0]+1
            }
            
            num = ""
        }
    }
    
    var sorted_list = Array(hash).sorted(by:{$0.1 > $1.1}).map{$0.0} // 횟수로 내림차순 후 , key만 
    
    
    
    return sorted_list
}