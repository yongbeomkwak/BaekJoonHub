import Foundation

struct Time{
    
    let start:Int
    let end:Int
    
    
    public static func < (lhs:Self,rhs:Self) -> Bool {
        
        if lhs.end < rhs.end {
            return true
        }
        else if lhs.end == rhs.end {
            return lhs.start < rhs.start
        }
        
        return false
    }
    
}

let n = Int(readLine()!)!

var a:[Time] = .init()

for _ in 0..<n {
    
    let time = readLine()!.split{$0 == " "}.compactMap({Int(String($0))!})
    
    a.append(Time(start: time[0], end: time[1]))
    
}

a.sort(by: <) // 끝나는 시간으로 정렬 후

var endTime:Int = 0

var ans:Int = 0

for time in a {
    
    if endTime <= time.start {
        ans += 1
        endTime = time.end
    }
    
}

print(ans)










