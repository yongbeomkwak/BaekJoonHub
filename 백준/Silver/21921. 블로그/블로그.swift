let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,x) = (input[0],input[1])

var list = readLine()!.split{$0 == " "}.map{Int($0)!}

var ans:Int = 0

var acc: [Int:Int] = [:]

var sum = 0
var left = 0

for i in 0..<n {
    
    if i < x-1 {
        sum += list[i]
        continue
    }
    
    sum += list[i]
    if ans <= sum {
        ans = sum
        acc[ans,default: 0] += 1
    }
    
    sum -= list[left] // 가장 왼쪽꺼 뺌
    left += 1 // 왼쪽꺼 옮김
}


print(ans == 0 ? "SAD" : ans)
if ans != 0 {
    print(acc[ans]!)
}



