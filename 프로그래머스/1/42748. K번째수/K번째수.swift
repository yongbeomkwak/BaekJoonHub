import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var ans: [Int] = []
    
    for command in commands {
        
        let i: Int = command[0]-1
        let j: Int = command[1]
        let k: Int = command[2]-1
        
        var slice: [Int] = [array[i]]
        
        if i < j {
             slice = Array(array[i..<j])
        }
        
        slice.sort()
        
        
        ans.append(slice[k])
        
    }
    
    
    return ans
}