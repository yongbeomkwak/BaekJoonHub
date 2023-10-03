import Foundation

let dx:[Int] = [-1,1,0,0]
let dy:[Int] = [0,0,-1,1]

extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}

func solution(_ maps:[String]) -> [Int] {
    
    let n = maps.count
    let m = maps[0].count
    var ans:[Int] = []
    
    var visited:[[Bool]] = [[Bool]](repeating:[Bool](repeating:false,count:m),count:n)
    
    func dfs(_ x:Int, _ y:Int) -> Int {
        
        if visited[x][y] {
            return 0 
        }
        
        if maps[x][y] == "X" {
            return 0
        }
        
        visited[x][y] = true
        
        var ret:Int = Int(String(maps[x][y]))!
        
        for i in 0..<4{
        
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                continue
            }
            
            ret += dfs(nx,ny)
        }
        
        return ret
    }
    
    for i in 0..<n {
        for j in 0..<m{
            
            if visited[i][j] {
                continue
            }
            
            let ret = dfs(i,j)
            
            if ret != 0 {
                ans.append(ret)
            }
        }
    }

    
    return ans.isEmpty ? [-1] : ans.sorted()
}