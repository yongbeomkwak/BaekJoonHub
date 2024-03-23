let nm = readLine()!.split {$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

let a = readLine()!.split {$0 == " "}.map{Int($0)!}
let b = readLine()!.split {$0 == " "}.map{Int($0)!}

var l = 0
var r = 0

var ans =  [String]()

while l < n &&  r < m {
    if a[l] < b[r] {
        ans.append("\(a[l])")
        l += 1
    } else {
        ans.append("\(b[r])")
        r += 1
    }
    
}


while l < n {
    ans.append("\(a[l])")
    l += 1
}

while r < m {
    ans.append("\(b[r])")
    r += 1
}

print(ans.joined(separator: " "))
