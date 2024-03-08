let n = Int(readLine()!)!
let target = Int(readLine()!)!

var board = [[String]](repeating: [String](repeating: "0", count: n), count: n)

enum Dir {
    
    case top
    case right
    case bottom
    case left
    
    
    func move(_ coor: (Int,Int)) -> (Int,Int) {
        
        switch self {
            
        case .top:
            return (coor.0-1,coor.1)
        case .right:
            return (coor.0,coor.1+1)
        case .bottom:
            return (coor.0+1,coor.1)
        case .left:
            return (coor.0,coor.1-1)
        }
        
    }
    
    func next() -> Self {
        
        switch self {
            
        case .top:
            return .right
        case .right:
            return .bottom
        case .bottom:
            return  .left
        case .left:
            return .top
        }
        
    }
    
    func invert() -> Self {
        
        if self == .left {
            return .right
        } else {
            return .left
        }
         
    }
    
}

let end = n*n

var num = 1

var loop = 1

var nowCoor = (n/2,n/2)

var nowDir : Dir = .top

var expandDir : Dir = .right

var answer : (Int,Int) = (0,0)

while num <= end {

    // 채우고
    for i in 0..<loop {
        if num > end {
            break
        }
        
        board[nowCoor.0][nowCoor.1] = "\(num)" // 숫자 기입
        
        if num == target {
            answer = (nowCoor.0+1,nowCoor.1+1)
        }
        
        num += 1 // 증가
        
        nowCoor = nowDir.move(nowCoor) // 현재방향에 맞게 이동
    }
    
    
    if nowDir == expandDir { // 현재가 right 혹은 left 일때 다음 step이 1씩 증가해야함
        loop += 1
        expandDir = expandDir.invert() // 루프가 증가했으므로 다음 학장 방향을 반전
    }
    
    nowDir = nowDir.next() // 다음 방향
    
}

for row in board{
    print(row.joined(separator:" "))
}
print("\(answer.0) \(answer.1)")
