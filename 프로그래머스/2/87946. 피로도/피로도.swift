import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {

    let n = dungeons.count

    var ans = 0

    var visited: [Bool] = [Bool](repeating:false,count: n)

    func dfs(_ stamina:Int,_ now:Int) {
        
        ans = max(ans,now)
        
        for (i,dungeon) in dungeons.enumerated() {
            
            let minimum = dungeon[0]
            let consume = dungeon[1]
            
            if visited[i] == true {
                continue
            }
            
            if stamina >= minimum {
                visited[i] = true 
                dfs(stamina-consume,now+1)
                visited[i] = false
            }
            
            
        }
        
        
    }

    dfs(k,0)

    return ans
}