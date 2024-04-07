import Foundation
var s = readLine()!

s = s.replacingOccurrences(of: "XXXX", with: "AAAA")
s = s.replacingOccurrences(of: "XX", with: "BB")

if s.contains("X") {
    print(-1)
} else {
    print(s)
}

