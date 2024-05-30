import Foundation

func input() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!


let vote = input()
var result: [Int] = []
var cnt: [Int] = []
        
for v in vote {
    if result.contains(v) {
        cnt[result.firstIndex(of:v)!] += 1
    } else {
        if result.count >= n {
            
            let minValue = cnt.min()!
            
            let idx = cnt.firstIndex(of: minValue)!
            cnt.remove(at: idx)
            result.remove(at: idx)
            
        }
        
        result.append(v)
        cnt.append(1)
    }
}

print(result.sorted().map{String($0)}.joined(separator: " "))

