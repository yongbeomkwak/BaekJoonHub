let n = Int(readLine()!)!

var stack: [Int] = []

var building: Int = 0

var set: Set<Int> = .init()


for _ in 0..<n {
    let xy = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (x,y) = (xy[0],xy[1])
    
    
    while !stack.isEmpty && stack.last! > y { // last에 위치한 높이가 현재 높이와 같거나 작아질 때까지 pop

        if stack.last != 0 { // 땅이 아니면
            building += 1 // 이전 높이는 별개의 빌딩임을 인정함
        }
      
        
        stack.popLast()
    }

    if !stack.isEmpty && stack.last == y {continue}
    
    stack.append(y)
}

building += stack.filter{$0 != 0 }.count // 남은 건물

print(building)



