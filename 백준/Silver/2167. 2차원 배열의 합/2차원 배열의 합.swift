import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}



let nm = input()
let (n,m) = (nm[0],nm[1])

var matirxA: [[Int]] = [[Int](repeating: 0, count: m+1)]


for _ in 0..<n {
    matirxA.append([0]+input())
}

for i in 1...n {
    for j in 1...m {
        matirxA[i][j] += matirxA[i-1][j] + matirxA[i][j-1] - matirxA[i-1][j-1]
    }
}

let k = Int(readLine()!)!

for _ in 0..<k {
    let ijxy = input()
    let (i,j,x,y) = (ijxy[0],ijxy[1],ijxy[2],ijxy[3])
    print(matirxA[x][y] - matirxA[i-1][y] - matirxA[x][j-1] + matirxA[i-1][j-1])
}

