var s = Array(readLine()!)

var result: Int = 0
var visisted: [Bool] = [Bool](repeating: false, count: s.count)
var target: [Character] = ["q","u","a","c","k"]

// qu q a c u k q a u a c k c k



func find(begin:Int) {
    
    
    var i: Int = 0
    var isSameDuck: Bool = false
    
    for j in begin..<s.count {
        
        if target[i] == s[j] && !visisted[j] { // 방문한 적 없고
     
            visisted[j] = true
            if target[i] == "k" { // 마지막 k 일경우
                
                if !isSameDuck {
                    result += 1
                    isSameDuck = true // 이후 발견되는 것은 같은 오리로 취급
                }
                i = 0 // 타겟인덱스 다시 처음으로
                continue
            }
            i += 1
        }
        
        
    }
    
}

for i in 0..<s.count {
    if s[i] == "q" && !visisted[i] {
        find(begin: i)
    }
}


if !(visisted.filter({$0 == false}).isEmpty) || s.count % 5 != 0 || result == 0  {
    print(-1)
} else {
    print(result)
}
