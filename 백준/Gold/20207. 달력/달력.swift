struct Task {
    var start, end : Int
    
    static func <= (lhs: Self, rhs: Self) -> Bool {
        
        if lhs.start == rhs.start {
            return abs(lhs.end - lhs.start) > abs(rhs.end - rhs.start)
        }
        
        return lhs.start < rhs.start
    }
    
}

let n = Int(readLine()!)!

var calendar: [Task] = []



for _ in 0..<n {
    
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    calendar.append(Task(start: input[0], end: input[1]))
}

calendar.sort(by: <=)


var height = [Int](repeating: 0, count: 366)
for task in calendar {

    for i in task.start...task.end {
        height[i] += 1
    }
    
}

var answer: Int = 0

var width = 0
var maxHeight = 0

for i in 1...365 {
    
    if height[i] != 0 {
        width += 1
        maxHeight = max(height[i],maxHeight)
    } else {
        
        answer += width * maxHeight
        
        width = 0
        maxHeight = 0
    }
}

print(answer +  width * maxHeight)



