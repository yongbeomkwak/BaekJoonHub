let input1 = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (input1[0],input1[1])

var rooms: [[(level : Int,user : String)]] = .init() // (레벨,유저이름)


outer: for _ in 0..<n {
    
    let input2 = readLine()!.split{$0 == " "}
    
    let (level,user) = (Int(input2[0])!,String(input2[1]))
    
    for (i,room) in rooms.enumerated() {
        
        if room.count == m { // 풀방
            continue
        }
        
        let lv = room[0].level
        
        if (lv-10...lv+10) ~= level  { // 방에 들어갈 레벨이고
            rooms[i].append((level:level,user:user)) // 입장
            continue outer // 다음 유저
        }
    }
    
    //여기 까지 왔으면 입장 못한거
    
    rooms.append([(level:level,user:user)]) // 방 생성
    
}




for room in rooms {
    
    if room.count == m { // 시작
        print("Started!")
    } else {
        print("Waiting!")
    }
    
    let sorted_room_info = room.sorted{ $0.user < $1.user } // 사전순
    
    for (level,user) in sorted_room_info {
        print("\(level) \(user)")
    }
}
