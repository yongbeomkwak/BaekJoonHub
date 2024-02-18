let n = Int(readLine()!)!
let k = Int(readLine()!)!

var cards : [Int] = []

for _ in 0..<n {
    cards.append(Int(readLine()!)!)
}

var hash: [Int:Int] = [:]

var visited: [Bool] = [Bool](repeating: false, count: n)

func backtracking(_ count: Int,_ now: String) {

    if count == k {
        
        let now = Int(now)!
        if hash[now] == nil {
            hash[now] = 1
        }
        return
    }
    
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            backtracking(count+1, now+String(cards[i]))
            visited[i] = false
        }
    }

}

backtracking(0, "")
print(hash.count)
