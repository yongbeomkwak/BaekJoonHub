import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    } 
}


func solution(_ maps:[String]) -> [Int] {
    
    let n = maps.count
    let m = maps[0].count 
    var ans: [Int] = []
    
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count:m), count: n)

    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [1,-1,0,0]
    
    func dfs(_ x:Int, _ y:Int) -> Int {
        
        visited[x][y] = true 
        var sum = 0 
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
            if visited[nx][ny] || maps[nx][ny] == "X" { continue }
            
            sum += dfs(nx,ny)
            
        }
        
        return Int(maps[x][y])! + sum
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if maps[i][j] != "X" && !visited[i][j] {
                ans.append(dfs(i,j))
            }
        } 
            
    }
    
    return ans.isEmpty ? [-1] : ans.sorted()
}