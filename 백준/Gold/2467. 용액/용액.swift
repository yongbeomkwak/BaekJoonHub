let n = Int(readLine()!)!

var solutions : [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}


var left = 0
var right = solutions.count-1

var ans: [Int] = [0,0]

func mix (_ a: Int , _ b: Int) -> Int {
    return abs(a+b)
}


ans[0] = solutions[left]
ans[1] = solutions[right]

while left < right {
    
    let sum = solutions[left] + solutions[right]
    
    if mix(ans[0], ans[1]) > mix(solutions[left],solutions[right]) {
        ans[0] = solutions[left]
        ans[1] = solutions[right]
    }
    
    
    if sum < 0 { // 아칼리가 높음
        
        left += 1
        
    } else { // 산성이 높음
         
        right -= 1
    }
        
}


ans.sort()

print("\(ans[0]) \(ans[1])")

