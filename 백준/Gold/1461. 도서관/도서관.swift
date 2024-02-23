let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var books = readLine()!.split{$0 == " "}.map{Int($0)!}

var negative : [Int] = []
var positive: [Int] = []

for b in books {
    
    b > 0 ? positive.append(b) : negative.append(b)
}

negative.sort(by:>)
positive.sort()


func putItBack(_ arr: inout [Int]) -> Int {
    
    var dist: Int = 0
    
    while !arr.isEmpty {
        
        var last = arr.popLast()! // 1개
        
        for _ in stride(from: 0, to: m-1, by: 1) { // 한번에 들 수 있는 개수 m개를 맞추기 위해 , m-1 개
            arr.popLast()
        }
        
        dist += abs(last*2) // 왕복
        
    }
    
    return dist
}

var result : Int = 0

if abs(positive.last ?? 0)  > abs(negative.last ?? 0) { // 가장 먼 곳이 양수면 , negative 층부터 감
    
    
    result += putItBack(&negative)

    
    // positive로 퇴근하기 때문에 , 마지막 m은 왕복없이 한번만 더해준다.
    for i in 0..<m {
        
        if i == 0 {
            result += abs(positive.popLast() ?? 0)
        } else {
            positive.popLast()
        }
        
        
    }
    
    
    
    // 이후 나머지 책들을 먼저 갖다둔다.
    
    result += putItBack(&positive)
    
    
    
    
} else { // negative로 퇴근
    
    result += putItBack(&positive)

    // negative로 퇴근하기 때문에 , 마지막 m은 왕복없이 한번만 더해준다.
    for i in 0..<m {
        
        if i == 0 {
            result += abs(negative.popLast() ?? 0)
        } else {
            negative.popLast()
        }
        
        
    }
    
    
    // 이후 나머지 책들을 먼저 갖다둔다.
    
    result += putItBack(&negative)
}


print(result)
