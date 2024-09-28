import Foundation

func strToInt(_ s: String) -> Int {
    let componets = s.components(separatedBy: ":")
    let h = Int(componets[0])!
    let m = Int(componets[1])!
    let s = Int(componets[2])!
    
    return h*3600 + m*60 + s 
}

func intToStr(_ t: Int) -> String {
    var t = t 
    let h = t / 3600
    t %= 3600
    let m = t / 60
    t %= 60
    let s = t 
    
    let hStr = h < 10 ? "0\(h)" : "\(h)"
    let mStr = m < 10 ? "0\(m)" : "\(m)"
    let sStr = s < 10 ? "0\(s)" : "\(s)"
    
    
    return hStr + ":" +  mStr + ":" + sStr
}


func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    let endTime = strToInt(play_time)
    let advTime = strToInt(adv_time)
    var accTime: [Int] = [Int](repeating:0, count:endTime+1)
    
    if endTime == advTime {
        return "00:00:00"
    }
    
    let logs = logs.map{$0.components(separatedBy:"-")}.map{
        return (strToInt($0[0]), strToInt($0[1]))
    }
    
    for log in logs {
    
        let s = log.0
        let e = log.1
        
        accTime[s] += 1
        accTime[e] -= 1

    }
    
     for t in 1...endTime {
        accTime[t] += accTime[t-1]
    }
    
    for t in 1...endTime {
        accTime[t] += accTime[t-1]
    }
    
    var mostView: Int = 0
    var answer: Int = 0
    
    for t in stride(from: advTime-1, to: endTime, by: 1) {
        
        if t >= advTime {
            
            if mostView < accTime[t] - accTime[t-advTime] {
                mostView = accTime[t] - accTime[t-advTime]
                answer = t - advTime + 1 
            }
            
        } else {
            if mostView < accTime[t] {
                mostView = accTime[t]
                answer = t - advTime + 1 
            }
        }
        
    }
        
    return intToStr(answer)
}