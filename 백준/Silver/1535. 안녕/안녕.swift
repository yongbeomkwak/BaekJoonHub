let n = Int(readLine()!)!

let hp = readLine()!.split{$0 == " "}.map{Int($0)!}
let happiness = readLine()!.split{$0 == " "}.map{Int($0)!}

var dp = Array(repeating:Array(repeating: 0, count: 101),count:n)


func dfs(_ index: Int,_ life:Int) -> Int {

    if index >= n {
        return 0
    }
    
    if dp[index][life] != 0 {
        return dp[index][life]
    }
    
    if life - hp[index] > 0 {
        dp[index][life] = dfs(index+1, life-hp[index])+happiness[index]
    }
    
    dp[index][life] = max(dp[index][life],dfs(index+1, life))
    
    
    
    return dp[index][life]
}


print(dfs(0, 100))
