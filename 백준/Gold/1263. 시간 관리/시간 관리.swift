struct Task {
    let take: Int
    let end: Int
    
    init(_ take: Int, _ end: Int) {
        self.take = take
        self.end = end
    }
    
}

let n = Int(readLine()!)!

var arr: [Task] = []

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let t = Task(input[0],input[1])
    
    arr.append(t)
}

arr.sort(by: {$0.end <= $1.end})


var ans: Int = -1

var left = 0
var right = 1000 * 1000000


func canFinsh(_ start: Int) -> Bool {
     
    
    var start = start
    
    for t in arr {
        
        if start + t.take > t.end {
            return false
        }
        
        start += t.take
    }
    
    return true
}


while left <= right {
    
    let mid = (left+right)/2
    
    if canFinsh(mid) {
        ans = mid
        left = mid+1
    } else {
        right = mid-1
    }
    
}

print(ans)
