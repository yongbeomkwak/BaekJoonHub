
func timeToInt (_ s:String) ->Int {
    
    let time = s.split{$0 == ":"}.compactMap{Int($0)}
    
    
    return time[0]*60 + time[1]
}

func intToTime(_ i:Int) -> String {
    
    var hour = String(i / 60)
    var min = String(i % 60)
    min = min.count > 1 ? min : "0\(min)"
    hour = hour.count > 1 ? hour : "0\(hour)"
    
    return "\(hour):\(min)"
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    
    var timeTable:[Int] = timetable.map{timeToInt($0)}.sorted(by:>=)
    var startTime = timeToInt("09:00")
    var endTime = startTime + (n) * t
    if timeTable.isEmpty {
        return intToTime(endTime - t)
    }
    
    
    var answer:String = ""
    
    for busTime in stride(from:startTime,to:endTime,by:t) {
        var takeBus:Int = 0
        var lastTime:Int = 0
        while !timeTable.isEmpty && busTime >= timeTable[timeTable.count-1] && takeBus < m  {
            takeBus += 1
            lastTime = timeTable.removeLast()
        }
        
        if busTime == endTime - t { // 마지막 버스 
            
            if takeBus == m { // 만약 모든 인원이 꽉 찼다면
                answer = intToTime(lastTime-1) // 바로 직전 인원보다 1분 빨리 온다 ..
            }
            else { // 만약 여유 공간이 있다면 버스 출발 시간에 온다
                answer = intToTime(busTime)
            }
        }
        
    }
    
    
    
    return answer
}