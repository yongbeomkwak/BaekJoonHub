from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


dx = [0,0,1,-1]
dy = [1,-1,0,0]

n,m = map(int,input().split())


board = ["" for _ in range(n)]


for i in range(n):
    board[i] = input()[:-1]



visit = [[0 for _ in range (m)] for _ in range(n)]


visit[0][0] = 1
q = deque()

q.append((0,0))

while q:
    
    nowX,nowY = q.popleft()
    
    
    for i in range(4):
        
        nx = nowX + dx[i]
        ny = nowY + dy[i]
        
        if nx < 0 or nx >= n or ny < 0 or ny >= m or board[nx][ny] == "0" or visit[nx][ny] != 0:
            
            continue
            
        q.append((nx,ny))
        visit[nx][ny] = visit[nowX][nowY] + 1 
            


print(visit[n-1][m-1])
        
        
        
    
    

        
    

    



    




