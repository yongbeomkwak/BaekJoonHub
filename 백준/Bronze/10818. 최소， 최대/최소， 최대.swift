import Foundation


let n: Int = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
print(numbers.min()!, numbers.max()!)