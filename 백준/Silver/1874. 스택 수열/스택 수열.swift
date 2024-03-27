let n = Int(readLine()!)!

var stk : [Int] = []

var flag: Bool = true
// 1 ~ n 방향으로

var curr = 1

var ans: [String] = []

for _ in 0..<n {
    let target = Int(readLine()!)! // 4
    
    while curr <= target {
        ans.append("+")
        stk.append(curr)
        curr += 1
    }
    // stk: 1 ~ target
     
    // 1,2,3
    if !stk.isEmpty && stk.last! == target {
        let _ = stk.popLast()
        ans.append("-")
    } else {
        flag = false
        break
    }
    
    // 1,2,3
    
    
}

if flag == false {
    print("NO")
} else {
    print(ans.joined(separator: "\n")) // ans = ["+","-"]
}
