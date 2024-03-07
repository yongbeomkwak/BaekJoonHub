let n = Int(readLine()!)!

var hash: [Int:Int] = [:]

var state : [Int] = [Int](repeating: -1, count: 11)

var count: Int = 0

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (cow,side) = (input[0],input[1])
    
    if state[cow] == -1 {
        state[cow] = side
    } else {
        
        if state[cow] != side {
            count += 1
            state[cow] = side
        }
        
    }

}

print(count)
