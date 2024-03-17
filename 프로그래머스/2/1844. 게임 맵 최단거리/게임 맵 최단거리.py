from collections import * 


def solution(maps):
    n = len(maps)
    m = len(maps[0])
    queue = deque()
    dx = [0,0,1,-1]
    dy = [1,-1,0,0]
    
    
    queue.append((0,0,1))
    
    visited = [[False for _ in range(m)] for _ in range(n)]
    
    visited[0][0] = True
    
    while queue:
        x,y,dist = queue.popleft()
        
        if x == n-1 and y == m-1:
            return dist
        
        
        for i in range(4):
            nx = x+dx[i]
            ny = y+dy[i]
            
            if nx < 0 or nx >= n  or ny < 0 or ny >= m:
                continue
            
            if visited[nx][ny]:
                continue
            
            if maps[nx][ny] == 0:
                continue
            
                
            queue.append((nx,ny,dist+1))
            visited[nx][ny] = True 
            
    
    
    return -1