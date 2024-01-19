let input1 = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,new,p) = (input1[0],input1[1],input1[2])


var list: [Int] = []

if n > 0 {
     list = readLine()!.split{$0 == " "}.map{Int($0)!}
}


var rank: Int = 1
var cnt:Int = 0

for i in list {
    
    if i > new {
        rank += 1
        cnt += 1
    } else if i == new {
        cnt += 1
        continue
    } else {
        break
    }
}


if cnt == p {
    rank = -1
}

if n == 0 {
    rank = 1
}


print(rank)


