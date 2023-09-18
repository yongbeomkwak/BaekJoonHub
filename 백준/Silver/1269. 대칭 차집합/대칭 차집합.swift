import Foundation


let nab = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}


let sa = Set(readLine()!.split{$0 == " "}.compactMap{Int(String($0))!})
let sb = Set(readLine()!.split{$0 == " "}.compactMap{Int(String($0))!})


print(sa.subtracting(sb).count + sb.subtracting(sa).count)
