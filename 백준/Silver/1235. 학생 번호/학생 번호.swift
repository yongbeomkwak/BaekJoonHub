import Foundation

extension String {
    
    subscript(_ range:Range<Int>) -> String {
        
        let start = self.startIndex
        
        let from = self.index(start, offsetBy: range.lowerBound)
        let to = self.index(start,offsetBy: range.upperBound)
        
        return String(self[from..<to])
        
    }
    
}

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let n = Int(readLine()!)!

var number: [String] = []

var limit = 0

for _ in 0..<n {
    let str = readLine()!
    limit = str.count
    number.append(str)
}

number.sort()

func check(_ l: Int) -> Bool {
    
    var set = Set<String>()
    
    let from = limit-l
    for i in 0..<n {
        
        let str = number[i][from..<limit]
        if set.contains(str) {
            return false
        }
        
        set.insert(str)
        
    }
    
    return true
    
}

var flag = false

for i in stride(from: 1, to: limit, by: 1) {
    flag = check(i)
    if flag {
        print(i)
        break
    }
    
}

if !flag {
    print(limit)
}
