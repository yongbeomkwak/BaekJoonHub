import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}


func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

var lp = 0
var rp = 1

let n = Int(readLine()!)!

let arr = input()

var ans: [String]  = []

while lp <= rp {
    
    if lp == n-1 {
        break
    }
    
    if arr[lp] != arr[rp] {
        ans.append(String(repeating: "\(rp+1) ", count: rp-lp))
        lp = rp
        rp += 1
    } else if rp == n-1 && arr[lp] == arr[rp] {
        ans.append(String(repeating: "-1 ", count: rp-lp))
        break
    } else if arr[lp] == arr[rp] {
        rp += 1
    }
    
}

ans.append("-1")

print(ans.joined())
