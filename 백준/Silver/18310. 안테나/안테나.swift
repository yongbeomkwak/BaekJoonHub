let n = Int(readLine()!)!

var pos = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted()

let mid = n%2 != 0 ? n/2 : (n/2)-1


print(pos[mid])