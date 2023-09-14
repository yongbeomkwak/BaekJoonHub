import Foundation
func solution(_ board:[[Int]]) -> Int {
    let N = board.count
    let dir = [[-1,0,1,0],[0,1,0,-1]]
    
    // 좌표까지 경주로를 건설할 때 사용되는 최소 cost 저장, Int.max값으로 초기화
    var costBoard = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: N)
    
    func isInside(_ r: Int, _ c: Int) -> Bool {
        if r < 0 || r >= N || c < 0 || c >= N {
            return false
        }
        return true
    }
    
    // dir: 현재 위치로 오게된 방향 인덱스
    func dfs(_ cur: (r: Int, c: Int, cost: Int, dir: Int)) {
        
        // 이동한 곳이 벽이거나 배열에 저장된 최솟값 보다 큰 경우 바로 리턴        
        if board[cur.r][cur.c] == 1 || cur.cost > costBoard[cur.r][cur.c] {
            return
        }
        
        // 최솟값으로 갱신
        costBoard[cur.r][cur.c] = cur.cost
    
        // 상하좌우로 탐색
        for idx in 0..<4 {
            let nr = cur.r + dir[0][idx]
            let nc = cur.c + dir[1][idx]
            
            if isInside(nr, nc) {
                // 직전 방향과 같을 경우, cost + 100
                if cur.dir == idx {
                    dfs((r: nr, c: nc, cost: cur.cost + 100, idx))
                } else {
                // 방향을 꺾을 경우 코너 + 직선도로가 생기므로 cost + (100 + 500)
                    dfs((r: nr, c: nc, cost: cur.cost + 600, idx))
                }
            }
        }
    }
    
    // 출발점 cost 0으로 갱신
    
    costBoard[0][0] = 0
    
    // 출발점에선 상하좌우 중 하, 우방향만 가능하므로 두 방향으로 dfs 함수 호출
    
    dfs((r: 0, c: 1, cost: 100, dir: 1))
    dfs((r: 1, c: 0, cost: 100, dir: 2))
    
    // 도착점 최솟값 리턴
    return costBoard[N - 1][N - 1]
}