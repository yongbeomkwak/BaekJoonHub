let n = Int(readLine()!)!

let developers = readLine()!.split{$0 == " "}.map{Int($0)!}

var a = 0
var b = n-1

var ans = 0

while b-a > 1 {
    
    let l = b-a-1
    
    let left = developers[a]
    let right = developers[b]
    
    
    ans = max(ans,min(left,right) * l)
    
    if right > left {
        a += 1
    } else {
        b -= 1
    }
    
    
    
}

print(ans)
