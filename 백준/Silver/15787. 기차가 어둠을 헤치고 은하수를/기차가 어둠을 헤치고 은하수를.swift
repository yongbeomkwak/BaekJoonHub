let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

/* 커맨드

 1. i번째 기차 x번째 좌석에 손냄을 태워
 2. i번째 기차 x번째 좌석 내려
 3. i번째 기차에 앉은 승객들 한칸식 뒤로 k -> k+1 , 20번째는 내려
 4. i번째 기차에 앉아 있는 승객들 앞으로 한칸씩 앞으로 k -> k-1, 1번째는 내려
 
 같은 패턴이 이미 존재하면 건너 갈 수 없음
 
 */

enum Command : Int {
    case a = 1
    case b
    case c
    case d
}

var train = [Int](repeating:0 , count: n)

for _ in 0..<m {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let command : Command = Command(rawValue: input[0])!
    
    let i = input[1]-1
    
    switch command {
        
        case .a:
            let x = input[2]
            
            let bit = 1 << x
        
            train[i] |= bit
            
            
        case .b:
            let x = input[2]
        
            let bit = 1 << x
        
            train[i] &= ~bit

        
        case .c:
                
            //하나씩 당기는 것이므로 왼쪽으로 밀고
            //다시 20자리로 맞쳐줌
        
            train[i] =  train[i] << 1
            train[i] &= ((1<<21)-1)
 
        case .d:
        
            train[i] = train[i] >> 1
            train[i] &= ~1
        
    }
    
}



var s = Set<Int>()

for i in 0..<n {
    s.insert(train[i])
}

print(s.count)

