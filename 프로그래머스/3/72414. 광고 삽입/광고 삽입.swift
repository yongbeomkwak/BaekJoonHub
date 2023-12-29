import Foundation

func intToTime(_ t:Int) -> String {

    var t = t 
    let h: String = "\(t/3600)".count == 1 ? "0\(t/3600)" : "\(t/3600)"
    t %= 3600
    let m: String = "\(t/60)".count == 1 ? "0\(t/60)" : "\(t/60)"  
    t %= 60
    let s: String = "\(t)".count == 1 ? "0\(t)" : "\(t)"
    
    return "\(h):\(m):\(s)"
}

func timeToInt(_ s:String) -> Int {
    
    var splited_s = s.split{$0 == ":"}.map{Int(String($0))!}
    
    
    return splited_s[0]*3600 + splited_s[1]*60 + splited_s[2]
}



func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {

    if play_time == adv_time {
        return "00:00:00"
    }
    
    var playSec = timeToInt(play_time)
    var advSec = timeToInt(adv_time)
    
    var counts: [Double] = [Double](repeating:0,count:playSec+1) // 각 인덱스는 초를의미 , [index] = 재생횟수 
    
    for log in logs {
        
        let splied_log = log.components(separatedBy: "-")
        let start = timeToInt(splied_log[0])
        let end = timeToInt(splied_log[1])
        
        counts[start] += 1
        counts[end] -= 1 
    }
    
    // 누적합 
    for t in 1...playSec {
        counts[t] += counts[t-1]
    }
    
    var sum: Double = counts[0..<advSec].reduce(0, +) // 처음부터 광고 시작 
    var maxSum: Double = sum
    var result = intToTime(0)
    
    
    for t in advSec...playSec { //
        
        sum -= counts[t-advSec] // 가장 왼쪽 값 빼주고 
        sum += counts[t] // 다음꺼 더해주고
    
        if maxSum < sum {
            maxSum = sum 
            result = intToTime(t-advSec+1) // 시작시간 변경
        }
    
    }
    
    return result
}