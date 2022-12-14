import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

let length = n.first!
for i in (1...length) {
    print(String(repeating: "*", count: i))
}