let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var p : [Int] = []


for _ in 0..<m {
    p.append(Int(readLine()!)!)
}

p.sort()

var result: (Int,Int) = (0,0)


for i in 0..<m {
    
    let amount = m-i > n ? n : m-i
    
    let income = amount*p[i]
    
    if income > result.1 {
        result = (p[i],income)
    }
    
    
}


print("\(result.0) \(result.1)")
