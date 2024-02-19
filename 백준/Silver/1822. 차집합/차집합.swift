let n = readLine()!.split{$0 == " "}.map{Int($0)!}

let (na,nb) = (n[0],n[1])

let setA = Set(readLine()!.split{$0 == " "}.map{Int($0)!})
let setB = Set(readLine()!.split{$0 == " "}.map{Int($0)!})

var result = setA.subtracting(setB)

print(result.count)
if !result.isEmpty {
    
    var s : [String] = []
    for r  in result.sorted() {
        s.append("\(r)")
    }
    
    print(s.joined(separator:" "))
}
