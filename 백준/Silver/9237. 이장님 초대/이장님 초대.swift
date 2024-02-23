let n = Int(readLine()!)!

var trees : [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by:>)

var endDay: Int = -1


for (d,t) in trees.enumerated() {
    
    let day = d+1
    
    endDay = max(endDay,day+t)
}

print(endDay+1)
