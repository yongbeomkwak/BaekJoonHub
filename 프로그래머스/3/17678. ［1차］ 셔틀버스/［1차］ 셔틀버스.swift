
func convert1(_ s: String) -> Int {
    
    var s = s.split{$0 == ":"}.map{Int($0)!}
    
    return s[0]*60 + s[1]
}

func convert2(_ t: Int) -> String {
    
    var h = "\(t/60)"
    var m = "\(t%60)"
    
    h = h.count == 1 ? "0\(h)" : h 
    m = m.count == 1 ? "0\(m)" : m
    
    return "\(h):\(m)"
}


func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    var timetable = Array(timetable.map{convert1($0)}.sorted().reversed())
    
    let first = convert1("09:00") // 첫차 시간 
    let last = first + ((n-1)*t) // 막차 시간 = 첫차시간 + (운행횟수-1) * 배차 간격 
    
    var s : String = ""
    
    for time in stride(from: first, through: last, by: t){
        
        var taked: Int = 0
        var last_taked_time: Int = 0
        
        
        while !timetable.isEmpty , timetable.last! <= time { // 현재 버스 시간 이하로 온 사람들 태움 

            if taked < m {
                taked += 1
                last_taked_time = timetable.removeLast() // 마지막 탑승 승객 시간 기록 
            } else {
                break
            }

        }
        
        if timetable.isEmpty || time == last { // 모두 탔거나 , 막차일 때 
            
            if taked < m { // 탑승인원 널널할 때
                s = convert2(time) 
            } else {
                s = convert2(last_taked_time-1)  // 마지막 탑승인원보다 1분 빠르기
            }
            
            break
        }
        
    
    }
    
    return s
}