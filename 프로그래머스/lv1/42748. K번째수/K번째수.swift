import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
var answer:[Int] = [Int]()

for command in commands {
    let i = command[0]
    let j = command[1]
    let k = command[2]
    answer.append(array[i-1...j-1].sorted()[k-1])
}
    
    return answer
}