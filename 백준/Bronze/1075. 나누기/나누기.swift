var n = readLine()!
let f = Int(readLine()!)!



var prefix = n.dropLast(2)

var result = ""

for i in 0...99 {

    var suffix = String(i)
    suffix =  suffix.count == 1  ? "0\(suffix)" : suffix
    
    if Int(prefix+suffix)! % f == 0 {
        result = suffix
        break
    }
    
}

print(result)

