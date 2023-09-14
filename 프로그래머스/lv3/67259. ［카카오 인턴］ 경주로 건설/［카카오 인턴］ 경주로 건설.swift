import Foundation


let dx = [-1,0,1,0] // 세로
let dy = [0,1,0,-1] // 가로




func solution(_ board:[[Int]]) -> Int {
   

    let n = board.count 
    var costMatrix =  [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    
    func dfs(_ x:Int , _ y:Int ,_ cost:Int ,_ dir:Int) {
        
        
        
        // 이동한 곳이 벽이거나 배열에 저장된 최솟값 보다 큰 경우 바로 리턴        
        if board[x][y] == 1 || cost  > costMatrix[x][y] {
            return
        }
        
        costMatrix[x][y] =  min(cost,costMatrix[x][y])

        for i in 0..<4 {
            
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            } 

            
       
            if dir  == i   { // 같은 방향
                dfs(nx,ny,cost+100,i)
            } 
            else{ // 다른 방향
                dfs(nx,ny,cost+600,i)
            }
        
        }
        
    }
    
    costMatrix[0][0] = 0 
    
    dfs(0,1,100,1)
    dfs(1,0,100,2)
    
    
    
    
   

    
    return costMatrix[n-1][n-1]
    
    
   
}