import Foundation

extension String {
    
    subscript(_ idx: Int) -> Character {
        
       self[self.index(self.startIndex, offsetBy: idx)]
        
    }
    
}

func readIntArray() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nm = readIntArray()

let (n, m) = (nm[0], nm[1])

if n == 0 {
    print(0)
    exit(0)
}

let books = readIntArray()

if n == 1 {
    print(1)
    exit(0)
}


var idx: Int = 0

var ans: Int = 0
var weight: Int = 0


while idx < books.count {
    
    if weight + books[idx] <= m {
        weight += books[idx]
        idx += 1
    } else {
        weight = 0
        ans += 1
    }
}

if weight != 0 {
    ans += 1
}

print(ans)
