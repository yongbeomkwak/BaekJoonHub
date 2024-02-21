let n = Int(readLine()!)!

var a = readLine()!.split{$0 == " "}.map{Int($0)!}
let b = readLine()!.split{$0 == " "}.map{Int($0)!}

let sorted_a = a.sorted()
let sorted_b = b.sorted(by: >)


var result: Int = 0

for (n1,n2) in zip(sorted_a,sorted_b) {
    result += n1*n2
}

print(result)
