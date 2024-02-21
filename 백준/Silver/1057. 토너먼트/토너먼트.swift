import Foundation

let nkl = readLine()!.split{$0 == " "}.map{Int($0)!}

var (n,k,l) = (nkl[0],nkl[1],nkl[2])

var ans: Int = 1


while Int(ceil(Double(k)/2.0)) != Int(ceil(Double(l)/2.0)) {
    
    k = Int(ceil(Double(k)/2.0))
    l = Int(ceil(Double(l)/2.0))
    ans += 1
}

print(ans)
