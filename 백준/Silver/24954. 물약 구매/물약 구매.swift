import Foundation

func input() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

let n = Int(readLine()!)!

var costs = input()
var discount : [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n)

for i in 0..<n {
    let pn = Int(readLine()!)!
    
    for _ in 0..<pn {
        let info = input()
        discount[i].append((info[0]-1,info[1]))
    }
}

var coins = Int.max

var visited: [Bool] = [Bool](repeating: false, count: n)
var order = [Int](repeating: 0, count: n)

func dfs(_ depth:Int) {
    
    if depth == n {
        
        var price = costs
        var money: Int = 0
        
        for o in order {
            money += price[o]
            
            for (j,k) in discount[o] {
                price[j] = price[j] > k ? price[j] - k : 1
            }
            
        }
        
        coins = min(coins,money)
        
        
        
        return
    }
    
    
    for i in 0..<n {
        
        if visited[i] { continue }
        
        visited[i] = true
        
        order[depth] = i
        
        dfs(depth+1)
        
        order[depth] = i
        
        visited[i] = false
        
    }
    
}

dfs(0)

print(coins)
