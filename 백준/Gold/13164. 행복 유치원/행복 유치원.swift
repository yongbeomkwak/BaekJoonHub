let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,k) = (nk[0],nk[1])

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var result: Int = 0

var gap: [Int] = []

for i in 1..<n {
    gap.append(arr[i]-arr[i-1])
}

gap.sort(by:>)

print(Array(gap[k-1..<gap.count]).reduce(0,+))

