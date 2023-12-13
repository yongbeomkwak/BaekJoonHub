import Foundation

extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    func initStack() -> [Character] {
        
        return Array(skill).reversed() 
    }
    
    let `set` = Set(Array(skill))
    
    var ans: Int = 0
    
    for st in skill_trees {
        
        var stk = initStack()
        
        var flag = true 
        
        for c in st {
            
            if set.contains(c) { // 정해진 순서의 스킬셋에 있는 스킬이면
                
                if !stk.isEmpty && stk.popLast()! == c { // 가장먼저 배워야할 스킬부터 접근 하면 
                    continue 
                } else {
                    flag = false // 불가능한 스킬 트리 
                    break
                }
                
            }
            
        }
        
        if flag { // 가능한 스킬 트리
            ans += 1
        }

        
    }
    
    return ans
}