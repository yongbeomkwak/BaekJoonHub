let n = Int(readLine()!)!

var calender: [(Int,Int)] = []

for _ in 0..<n{
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    calender.append((input[0],input[1]))
}

calender.sort(by: {
    
    if $0.0 == $1.0 {
        return $0.1 <= $1.1
    }
    
    return $0.0 < $1.0
})


var height = [Int](repeating: 0, count: 366)

let start = calender[0].0

for (s,e) in calender {
    
    for i in s...e {
        height[i] += 1
    }
}

var heightMax = 0
var width = 0
var ans: Int = 0
for i in start...365 {
    
    if height[i] == 0 {
        ans += width * heightMax
        width = 0
        heightMax = 0
    } else {
        heightMax = max(heightMax,height[i])
        width += 1
    }
    
}

print(ans + width * heightMax)
