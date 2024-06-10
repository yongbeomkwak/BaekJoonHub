import Foundation

extension String {
    subscript(_ index: Int) -> String {
        String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

func isPrime(_ n:Int) -> Bool {
    
    if n <= 1 {
        return false
    }
    
    
    var i = 2
    
    while i*i <= n {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    
   
    return true
    
}


var reverse: [String:String] = [:]
reverse["0"] = "0"
reverse["1"] = "1"
reverse["2"] = "2"
reverse["5"] = "5"
reverse["8"] = "8"

reverse["6"] = "9"
reverse["9"] = "6"


var str = readLine()!

var check1 = isPrime(Int(str)!)

var check2 = true

var str2: [String] = []

for i in stride(from: str.count-1, to: -1, by: -1) {
    
    guard let s = reverse[str[i]] else {
        check2 = false
        break
    }
    
    str2.append(s)
    
}

if check2 {
    check2 = isPrime(Int(str2.joined())!)
}



print(check1 && check2 ? "yes" : "no")







