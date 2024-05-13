
import Foundation



let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (input[0],input[1])

var adj: [[Int]] = [[]]

for _ in 0..<n {
    adj.append([0] + readLine()!.split{$0 == " "}.map{Int($0)!})
}

let succ = "Enjoy other party"
let fail = "Stay here"

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            
            if adj[i][j] > adj[i][k] + adj[k][j] {
                adj[i][j] = adj[i][k] + adj[k][j]
            }
            
        }
    }
}

var result: [String] = []

for _ in 0..<m {
    let tmp = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (a,b,c) = (tmp[0],tmp[1],tmp[2])
    
    if adj[a][b] <= c {
        result.append(succ)
    } else {
        result.append(fail)
    }
    
}


print(result.joined(separator: "\n"))
