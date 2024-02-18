let np = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,p) = (np[0],np[1])


var guitar : [[Int]] = [[Int]](repeating: [], count: n+1)

var ans: Int = 0

for _ in 0..<n{
    
    let input = readLine()!.split{$0 ==  " "}.map{Int($0)!}
    let (line,fret) = (input[0],input[1])
    
    
    if guitar[line].isEmpty {
        ans += 1 // 해당 줄 최초 플랏 잡기
        guitar[line].append(fret)
    } else {
     
        if guitar[line].last! == fret { // 이미 잡았던 플랏은 안 움직임
            continue
        }
        
        while !guitar[line].isEmpty && guitar[line].last! > fret {
            ans += 1
            guitar[line].removeLast() // 높은 플랏 손 때기
        }
        
        if !guitar[line].isEmpty && guitar[line].last! == fret { // 이미 잡았던 플랏은 안 움직임
            continue
        }
        
        guitar[line].append(fret)
        ans += 1 // 플랏 잡기
    }
    
    
}

print(ans)
