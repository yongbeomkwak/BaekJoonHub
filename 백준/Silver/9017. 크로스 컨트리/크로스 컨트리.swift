
var tc = Int(readLine()!)!

repeat {
    
    var n = Int(readLine()!)!
    
    var list = readLine()!.split{$0 == " "}.map{Int($0)!}
    var record: [Int:[Int]] = [:]
   
    var check: [Int:Int] = [:]
    
    list.forEach { // 먼저 6명 되는 지확인
        check[$0] = check[$0,default: 0]+1
    }
    
    var score = 1
    
    for team in list {
        
        if check[team,default: 0] != 6 { // 해당 팀이 6명이 안되면 넘어감
            continue
        }
        
        if record[team] == nil {
            record[team] = [score]
        } else {
            record[team] = record[team]! + [score]
        }
        
        score += 1 // 점수 증가
        
    }
    
    var winner: (Int,[Int]) = (0,[1000,1000,1000,1000,1000,1001])
    
    for (team,ranks) in record {
        
        let newSum = Array(ranks[0..<4]).reduce(0,+)
        let nowSum = Array(winner.1[0..<4]).reduce(0,+)
        
        
        if  newSum < nowSum  { // 만약 등수 합이 현재께 더 낮으면 , 교체
            winner = (team,ranks)
            
        } else if newSum == nowSum , ranks[4] < winner.1[4] { // 만약 등수 합이 같으면 , 5번째 선수 등수가 낮은게 이김
            winner = (team,ranks)
        }
            
        
        
    }
    
    print(winner.0)
    
    tc -= 1
} while tc > 0

