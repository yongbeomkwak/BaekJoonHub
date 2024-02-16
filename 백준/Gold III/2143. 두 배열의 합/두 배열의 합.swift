let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split{$0 == " "}.map{Int($0)!}
let m = Int(readLine()!)!
let b = readLine()!.split{$0 == " "}.map{Int($0)!}

var dict : [Int:Int] = [:]


for i in 0..<n {
    var aSum: Int = a[i]
    dict[aSum,default: 0] += 1
    for j in i+1..<n {
        aSum += a[j]
        dict[aSum,default: 0] += 1
    }
}

var result: Int = 0

for i in 0..<m {
    var bSum: Int = b[i]
    
    if dict[t-bSum] != nil {
        result += dict[t-bSum]!
    }
    
    for j in i+1..<m {
        bSum += b[j]
        if dict[t-bSum] != nil {
            result += dict[t-bSum]!
        }
    }
}

print(result)
