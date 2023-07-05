from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline



n , m = map(int,input().split())


board = []
queue = deque([])
visit = [[False]*m for _ in range(n)]
res = [[-1]*m for _ in range(n)]

for i in range(n):
    row = list(map(int, input().split()))

    for j in range(m):
        # 목표지점 찾기
        if row[j] == 2:
            queue.append((i, j))
            visit[i][j] = True
            res[i][j] = 0

        # 벽 기록
        if row[j] == 0:
            res[i][j] = 0
    board.append(row)
    
# BFS 탐색
direction = [(1, 0), (-1, 0), (0, 1), (0, -1)]  # 상하좌우
while queue:
    x, y = queue.popleft()

    for dx, dy in direction:
        nx, ny = x+dx, y+dy

        if 0 <= nx < n and 0 <= ny < m and not visit[nx][ny] and board[nx][ny] == 1:
            queue.append((nx, ny))
            visit[nx][ny] = True
            res[nx][ny] = res[x][y] + 1


for i in range(len(res)):
    print(*res[i])
    

    



    




