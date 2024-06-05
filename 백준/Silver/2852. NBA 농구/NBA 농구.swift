import Foundation


func convertToString(_ time: Int) -> String {
    
    let min = time / 60
    let sec = time % 60
    
    let m = min >= 10 ? "\(min)" : "0\(min)"
    let s = sec >= 10 ? "\(sec)" : "0\(sec)"
    
    return "\(m):\(s)"
}

func convertToInt(_ time: String) -> Int {
    
    let s = time.split{$0 == ":"}.map{Int($0)!}
    let min = s[0]
    let sec = s[1]

    
    return min*60 + sec
}

let n = Int(readLine()!)!

var score = 0
var time1: Int = 0
var time2: Int = 0
var winner = 0


var record = "00:00"

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{String($0)}
    
    let team = input[0]
    let time = input[1]
    
    if winner == 1 {
        
        time1 +=  convertToInt(time) - convertToInt(record)
        
    } else if winner == 2 {
        time2 +=  convertToInt(time) - convertToInt(record)
    }
    
    if team == "1"{
        score += 1
    } else {
        score -= 1
    }
    
    if score > 0 {
       winner = 1
    } else if score < 0 {
       winner = 2
    } else {
        winner = 0
    }
    
    record = time
    
}

if winner == 1 {
    
    time1 +=  convertToInt("48:00") - convertToInt(record)
    
} else if winner == 2 {
    time2 +=  convertToInt("48:00") - convertToInt(record)
}


print(convertToString(time1))
print(convertToString(time2))

