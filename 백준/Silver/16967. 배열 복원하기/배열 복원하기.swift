let hwxy = readLine()!.split{$0 == " "}.map{Int($0)!}

let (h,w,x,y) = (hwxy[0],hwxy[1],hwxy[2],hwxy[3])

var bArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 601), count: 601)

for i in 0..<h+x {
    let tmp = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 0..<w {
        bArr[i][j] = tmp[j]
    }
}

var aArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)

for i in 0..<h {
    for j in 0..<w {
        if  i-x < 0 || j-y<0 {
            aArr[i][j] = bArr[i][j]
        } else {
            aArr[i][j] = bArr[i][j] - aArr[i-x][j-y]
        }
    }
}


for i in 0..<h {
    print(aArr[i].map{String($0)}.joined(separator: " "))
}

