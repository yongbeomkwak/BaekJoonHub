import Foundation

// 최근에 나오는 순서 , 받으면 바로 시작
// 새로운과제가 나오면 중단 후 새로운 과제 진행
// 과제가 끝나면, 이전에 하던 부분부터 이어서

let n = Int(readLine()!)!

struct Task {
    var score, time: Int
}

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

var stk: [Task] = []

var result: Int = 0

func take() {
    
    guard let last =  stk.last else {
        return
    }
    
    stk[stk.count-1].time -= 1
    
    if stk.last!.time == 0 {
        result += last.score
        let _ = stk.popLast()
    }
    
    
}


for i in 0..<n {
    let arr = input()
    
    if arr[0] == 1 {
        stk.append(Task(score: arr[1], time: arr[2]))
    }
    take()
}

print(result)
