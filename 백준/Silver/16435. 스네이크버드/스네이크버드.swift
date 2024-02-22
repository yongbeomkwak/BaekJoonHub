let ns = readLine()!.split{$0 == " "}.map{Int($0)!}

var (n,s) = (ns[0],ns[1])

var fruits = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: >)


while !fruits.isEmpty && fruits.last! <= s {
    
    fruits.removeLast()
    s += 1
}

print(s)
