let n = Int(readLine()!)!
let k = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted()

var dist: [Int] = []

for i in stride(from: 1, to: n, by: 1){
    dist.append(arr[i]-arr[i-1])
}

dist.sort(by:>)

var ans: Int = 0

for i in stride(from: k-1, to: dist.count, by: 1) {
    ans += dist[i]
}

print(ans)



