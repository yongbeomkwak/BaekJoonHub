import Foundation

let n = Int(readLine()!)!

var s = String(n+1,radix:2)

s.removeFirst()


print(s.replacingOccurrences(of:"0",with:"4").replacingOccurrences(of:"1",with:"7"))
