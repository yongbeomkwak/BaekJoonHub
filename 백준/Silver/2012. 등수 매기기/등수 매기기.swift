let n = Int(readLine()!)!

var score: [Int] = []

for _ in 0..<n {
    score.append(Int(readLine()!)!)
}


score.sort()


var rank = Array(1...n)
var result: Int = 0


for i in 0..<n {
    result += abs(rank[i]-score[i])
}


print(result)
