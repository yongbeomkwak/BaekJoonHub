import Foundation

let n = Int(readLine()!)!

var queue: [Int] = Array((1...n))
var index: Int = 0

while index < queue.count {
    index += 1 // 버려
    if index < queue.count-1 {
    let front = queue[index]
        queue.append(front)
        index += 1
    }
}
print(queue.last!)
