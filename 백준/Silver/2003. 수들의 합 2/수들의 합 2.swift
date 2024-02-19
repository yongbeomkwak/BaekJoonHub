let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var a = readLine()!.split{$0 == " "}.map{Int($0)!}

var acc : [Int] = [Int](repeating:0,count:n)

acc[0] = a[0]

for i in 1..<n {
    acc[i] = acc[i-1] + a[i]
}

acc = [0] + acc

var right = 0

var ans : Int = 0

for left in 0...n {
    
    if right > n {
        break
    }
    
    while acc[right] - acc[left] < m {
        if right+1 > n {
            break
        }
        right += 1
    }
    
    if acc[right] - acc[left] == m {
        ans += 1
    }
    
}

print(ans)
