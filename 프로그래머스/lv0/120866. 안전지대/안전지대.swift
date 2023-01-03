import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var board = board
    let cnt = board.count 
    
    let dx = [1,0,-1]
    let dy = [1,0,-1]
    
    for i in (0..<cnt)
    {
        for j in (0..<cnt)
        {
            if(board[i][j] == 1)
            {
                for k in (0..<3)
                {
                    
                    for l in (0..<3)
                    {   
                        var nx = j
                        var ny = i
                        nx += dx[k]
                        ny += dy[l]
                        
                        if(nx < 0 || ny < 0 || nx >= cnt || ny >= cnt )
                        {
                            continue
                        }
                        if(board[ny][nx] == 0)
                        {
                            board[ny][nx] = 2  
                        }
                    }
                    
                   
                }
                
                
                
            }
        }
    }
    
    
    print(board)
    return board.map{ $0.filter{$0 == 0}.count }.reduce(0,+)
}