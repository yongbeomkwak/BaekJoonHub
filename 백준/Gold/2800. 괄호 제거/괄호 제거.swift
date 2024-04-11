import Foundation

let s = Array(readLine()!)

var l: [(Int,Int)] = []
var stk: [Int] = []


for (i,c) in s.enumerated() {
    if c == "(" {
        
        stk.append(i)
        
    } else if c == ")" {
        
        let start = stk.popLast()!
        
        l.append((start,i))
    }
}


func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    
    var result: [[T]] = []
    
    func comb(_ index:Int ,_ now:[T]) {
        
        if now.count == k  {
            result.append(now)
            return
        }
        
        
        for i in index..<elements.count {
            comb(i+1, now + [elements[i]])
        }
        
    }
    
    comb(0, [])
    
    return result
}

var set = Set<String>()

for i in 1...l.count {
    let comb = combination(l, i)
    
    for j in comb {
        var tmp = s
        
        for k in j {
            tmp[k.0] = "t"
            tmp[k.1] = "t"
        }
        set.insert(String(tmp).replacingOccurrences(of: "t", with: ""))
    }
}

print(set.sorted().joined(separator: "\n"))




