import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

//  I, V, X, L
//  1, 5, 10, 50



let roma = [1,5,10,50]
var set = Set<Int>()

let n = Int(readLine()!)!

func dfs(_ depth: Int,_ prev: Int  ,_ total: Int) {
    
    if depth == n {
        set.insert(total)
        return
    }
    
    for i in prev..<4 {
        dfs(depth+1, i, total + roma[i])
    }
    
}

dfs(0,0,0)

print(set.count)
