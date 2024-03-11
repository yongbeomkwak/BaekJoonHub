import Foundation
let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,k) = (nk[0],nk[1])

var s = readLine()!.split{$0 == " "}.map{Int($0)!}
let d = readLine()!.split{$0 == " "}.map{Int($0)!-1}


for _ in 0..<k {

    var tmp = s
    for i in 0..<n {
        tmp[d[i]] = s[i]
    }

    s = tmp
}

print(s.map{String($0)}.joined(separator: " "))

