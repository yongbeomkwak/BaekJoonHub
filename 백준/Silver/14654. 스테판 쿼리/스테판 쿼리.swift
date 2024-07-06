import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

func canWin(_ a: Int, _ b: Int) -> Int {

    if a == b {
        return 0
    }
    
    if (a == 1 && b == 3) || (a == 2 && b == 1) || (a == 3 && b == 2 ) {
        return 1
    }
    
    
    return 2
}


var i = 0
var j = 0

let n = Int(readLine()!)!

let teamA = readIntArray()
let teamB = readIntArray()

var k = 0
var ans = 0

var count = 1
var prevWinner = -1


for i in 0..<n {
    let result = canWin(teamA[i], teamB[i])
    
    var nowWinner = -1
    
    if result == 0 {
        nowWinner = prevWinner == 0 ? 1 : 0
    } else {
        
        nowWinner = result == 1 ? 0 : 1
        
    }
    
    if nowWinner == prevWinner {
        count += 1
    } else {
        ans = max(ans,count)
        count = 1
    }
    
    prevWinner = nowWinner
        
}

ans = max(ans, count)



print(ans)
