import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}
let nk = readIntArray()

let (n, k) = (nk[0], nk[1])

var adj: [Int] = [Int](repeating: 0, count: n)

for i in 0..<n {
    adj[i] = Int(readLine()!)!
}

var m = 1
var now = 0
var ans = -1

while m <= n {
    
    now = adj[now]
    
    if now == k {
        ans = m
        break
    }
    
    m +=  1
    
}

print(ans)


