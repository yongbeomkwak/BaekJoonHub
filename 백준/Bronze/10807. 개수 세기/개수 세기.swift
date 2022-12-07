import Foundation



let n:Int = Int(readLine()!)!

let input = readLine()?.split(separator: " ").map({Int($0)!})

let m:Int = Int(readLine()!)!
print(input!.filter{$0 == m }.count)