import Foundation



var n = Int(readLine()!)!

var arr:[Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var index:Int = arr.count

var result:[Int] = [Int](repeating:0,count:n)

var notRecieve:[(Int,Int)] = [] // (신호를 쏜 탑 위치, 높이)


while !arr.isEmpty {
    
    let k = arr.popLast()!

    
    
    while !notRecieve.isEmpty && k >= notRecieve[notRecieve.count-1].1 { // 아직 수신하지 않은 값이 있고 , 현재 높이보다 작거나 같으면 , 이번 탑에서 수신가능
            
            let last:(Int,Int) = notRecieve.popLast()!
            result[last.0] = index // 해당 신호를 쏜 탑의 수신 탑은 현재 탑이 된다.
    }
    
    index -= 1
        
    notRecieve.append((index,k))
    
    
}

print(result.map{String($0)}.joined(separator: " "))


