import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nm = input()
let (n,m) = (nm[0],nm[1])

var matrixA: [[Int]] = []
var matrixB: [[Int]] = []

for _ in 0..<n {
    matrixA.append(input())
}

let mk = input()
let k = mk[1]

for _ in 0..<m {
    matrixB.append(input())
}

var matrixC: [[String]] = [[String]](repeating: [String](repeating: "", count: k), count: n)

for i in 0..<n {
    for j in 0..<k {
        var result: Int = 0
        for t in 0..<m {
            result += matrixA[i][t] * matrixB[t][j]
        }
        matrixC[i][j] = "\(result)"
    }
}

var answer = matrixC.map{$0.joined(separator: " ")}.joined(separator: "\n")

print(answer)

