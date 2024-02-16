var n = Int(readLine()!)!

var hash: [Int:Int] = [:]

var a = readLine()!.split{$0 == " "}.map{Int($0)!}

for num in a {
    hash[num,default: 0] += 1
}

var result: [String] = [String](repeating: "-1", count: n)

var stk : [Int] = [0]

for i in 1..<n {
    
    while !stk.isEmpty && hash[a[stk.last!]]! < hash[a[i]]! {
        result[stk.popLast()!] = "\(a[i])"
    }
    stk.append(i)
    
}

print(result.joined(separator: " "))

