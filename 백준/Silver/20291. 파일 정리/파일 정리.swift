let n = Int(readLine()!)!

var files: [String] = []

var hash: [String:Int] = [:]

for _ in 0..<n {
    var s = readLine()!.split{$0 == "."}.map{String($0)}
    
    let ext = s[1]
    
    hash[ext,default: 0] += 1
    
}

for (k,v) in hash.sorted(by: {$0.key < $1.key}) {
    print("\(k) \(v)")
}
