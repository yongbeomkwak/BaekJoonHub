let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,d,k,c) = (input[0],input[1],input[2],input[3])

var sushies: [Int] = []

var eatenDish: [Int:Int] = [:]

for _ in 0..<n {
    sushies.append(Int(readLine()!)!)
}

var ans : Int = 0

var left = 0
var right = 0

eatenDish[c] = 1 // 쿠펀꺼는 일단 1개 추가


while right < k {
    eatenDish[sushies[right],default: 0] += 1
    right += 1
}

var result: Int = 0

while left < n { // left가 끝에 도달할 때 까지
    
    result = max(result,eatenDish.count)
    
    let l = sushies[left]
    let r = sushies[right]
    
    eatenDish[l]! -= 1
    if eatenDish[l] == 0 {
        eatenDish[l] = nil
    }
    
    
    eatenDish[r,default: 0] += 1
    
    left += 1
    right += 1
    right %= n // 인덱스 벗어남 방지
}

print(result)
    

    
 





