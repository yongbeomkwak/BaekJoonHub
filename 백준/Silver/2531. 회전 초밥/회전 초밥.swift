let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,d,k,c) = (input[0],input[1],input[2],input[3])

var arr: [Int] = []

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var hash: [Int:Int] = [:]

hash[c] = 1

var left = 0
var right = 0

while right < k {
    
    hash[arr[right],default: 0] += 1
    
    right += 1
}

var result = hash.count

while left < n {

    if hash[arr[left],default: 0] == 1 {
        hash[arr[left]] = nil
    } else {
        hash[arr[left],default: 0] -= 1
    }
    
    
    left += 1
    
    hash[arr[right],default:0] += 1
    right += 1
    right %= n
    result = max(result,hash.count)
    
}

print(result)
