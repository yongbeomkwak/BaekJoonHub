import Foundation



let nm = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}

var set = Set<String>()

var ans:Int = 0

for _ in 0..<nm[0] {
    set.insert(readLine()!)
}


for _ in 0..<nm[1]{
    
    if set.contains(readLine()!) {
        ans += 1
    }
    
}


print(ans)
