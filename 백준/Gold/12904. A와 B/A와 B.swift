var s = readLine()!
var t = readLine()!

let ls = s.count


while ls != t.count {
    
    if t.last! == "A" {
        t.removeLast()
    } else {
        var tmp = t
        tmp.removeLast()
        t = String(tmp.reversed())
    }
}

print(s == t ? 1 : 0)

