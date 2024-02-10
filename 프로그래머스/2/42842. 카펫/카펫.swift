import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let total = brown + yellow 
    
    var height : Int = 3 
    
    var ans: [Int] = [0,0]
    
    while true {
        
        let width = ((brown+4)-2*height) / 2 
        
        if total != width*height {
            height += 1
            continue 
        }
        
        
        ans[0] = width
        ans[1] = height 
        break
        
    }
    
    return ans
}