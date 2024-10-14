import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted()
let x = Int(readLine()!)!

var ans: Int = 0

var left: Int = 0
var right: Int = n-1

let max = 1000000

var count: [Int] = [Int](repeating: 0, count: max+1)

for num in arr {
    count[num] += 1
}

for n1 in arr {
    if n1 >= x {
        break
    }
    
    let n2 = x-n1
    
    if n1 > max || n2 > max {
        continue
    }
    
    
    ans += (count[n1] * count[n2])
    
}

print(ans/2)


