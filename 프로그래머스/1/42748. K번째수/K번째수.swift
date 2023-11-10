import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var answer:[Int] = []
    
    for command in commands {
    
        let i = command[0]-1 //인덱스 기준 
        let j = command[1]
        let k = command[2]
        
        let sliced_array = Array(array[i..<j])
        let sorted_array = sliced_array.sorted()
        
        answer.append(sorted_array[k-1])
        
        
    }
    
    
    return answer
}