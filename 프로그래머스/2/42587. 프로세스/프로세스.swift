import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var loc: Int = -1 
    
    var queue: [(Int,Int)] = priorities.map{
        loc += 1
        return ($0,loc) 
    }
    var sorted_priorities = priorities.sorted(by: >)
    
    var index: Int = 0
    var sorted_index: Int = 0
    
    var n = queue.count 
    
    var pc = 0 
    
    while index < n  {
        
        let element = queue[index]
        
        
        if sorted_priorities[sorted_index] == element.0 {
            
            pc += 1 
            sorted_index += 1
            
            
            // pop 하는 곳 
            
            if element.1 == location {
                break
            }
            
            
        } else {
            // push 하는 곳 
            
            queue.append(element)
            n += 1 
        }
        
        index += 1
        
        
        
    }
    
    
    
    return pc
}