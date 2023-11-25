func timeToMin(_ s: String) -> Int {
    
    let time = s.split{$0 == ":"}.map{Int($0)!}
    
    return time[0]*60 + time[1]
    
}

func minToTime(_ time:Int) -> String {
    
    var hour = String(time/60)
    var min =  String(time%60)
    
    hour = hour.count == 1 ? "0"+hour : hour
    min = min.count == 1 ? "0"+min : min
    
    return hour+":"+min
    
    
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    // n: 운행횟수
    // t: 운행 간격
    // m : 최대 크르 수
    
    var timeTable = timetable.map{timeToMin($0)}.sorted(by:>=)
    
    
    var busArrived: Int = 540 // 09:00
    
    var ans: String = ""
    
    for i in 0..<n {
        var bus:[Int] = []
            
        while  !timeTable.isEmpty, timeTable.last! <= busArrived , bus.count < m {
            bus.append(timeTable.removeLast())
        } 
        
        
        if bus.count == m { // 꽉찼으면
            let last = bus.last! // 마지막 승객
            ans = minToTime(last-1) // 마지막 승객보다 딱 1분 빨리옴 

        }
        else { // 여유 있으면 버스 도착 시간에
            ans = minToTime(busArrived)
        }
        
        busArrived += t  // 다음 버스 
        
    }
    
    return ans
}