import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nq = input()

let cowCount: Int = nq[0]
let countQ: Int = nq[1]

var cows = input()
let Q = input()
var dp: [Int] = [Int](repeating: 0, count: cowCount)

for i in 0..<cowCount {
    
    let prevIndex1 = i-1  < 0 ?  cowCount-1+i  : i-1
    let prevIndex2 = i-2  < 0 ?  cowCount-2+i  : i-2
    let prevIndex3 = i-3  < 0 ?  cowCount-3+i  : i-3
    
    
    dp[i] = cows[i] * cows[prevIndex1] * cows[prevIndex2] * cows[prevIndex3]
}

var sum = dp.reduce(0, +)

for idx in Q {
    for i in 0..<4 {
        let newIndex = (idx-1+i) % cowCount
        dp[newIndex] = -dp[newIndex]
        sum += 2*dp[newIndex]
    }
    print(sum)
}

