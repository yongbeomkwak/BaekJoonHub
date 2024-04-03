let n = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var ans: [Int] = [Int](repeating: 11, count: n)


for (i,p) in arr.enumerated() {
    
    let number = i+1
    
    var count: Int = 0
    for j in 0..<n {
    
        if count == p && ans[j] == 11 {
            ans[j] = number
            break
        }
        
        if ans[j] == 11 || ans[j] > number {
            count += 1
            continue
        }

    }
    
    
}

print(ans.map{String($0)}.joined(separator: " "))
