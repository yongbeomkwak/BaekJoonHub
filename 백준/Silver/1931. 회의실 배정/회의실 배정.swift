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

var arr: [Time] = []

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    arr.append(Time(start: input[0],end: input[1]))
}

arr.sort(by: <)

var endTime: Int = 0
var ans: Int = 0

for time in arr {
    
    if endTime <= time.start {
        endTime = time.end
        ans += 1
    }
    
}

print(ans)
