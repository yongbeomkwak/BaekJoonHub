import Foundation



var s = readLine()!

var pipes:[Character] = []

var answer:Int = 0


var prev:Character = "x"

for c in s {
    
    if c == "(" {
        
        pipes.append(c)
        prev = c
        continue
    }
    
    if prev == "(" && c == ")" {// 레이저 발사
        let _ =  pipes.popLast()!
        answer += pipes.count
    }

    if prev == ")" && c == ")"{ // 막대 마감
        let _ =  pipes.popLast()!
        answer += 1
    }
    prev = c
    
   
    
}

print(answer)
