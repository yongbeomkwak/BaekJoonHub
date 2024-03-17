import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    let n = numbers.count
    
    var ans:Int = 0 
    
    func dfs(_ index: Int,_ now: Int) {
     
        if index == n {
            
            if now == target {
                ans += 1
            }
            
            return 
        }
        
        dfs(index+1,now - numbers[index])
        dfs(index+1,now + numbers[index])
        
    }
    
    dfs(0,0)
    
    
    
    return ans
}