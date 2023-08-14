from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline


n = int(input())
m = int(input())

board = [[0] * n for _ in range(n)]

curr = n * n 

direct = 0  # 아래,오른쪽,위,왼
limits = [n,n-1,n-1,n-2] # 해당 방향마다 갈 수 있는 움직임 제한 수  , 방향 마다 그려지는 움직임 수를 비교하면 해당 식이 나옴 
dx = [1,0,-1,0] #  아래로 , 그대로, 위로 , 그대로 
dy = [0,1,0,-1] # 그대로, 오른쪽 , 그대로 , 왼쪽 
pos = [0,0,n] # x ,y 갈 수 있는 제한 수 



ans = [0,0]

while curr > 0:
    x = pos[0]
    y = pos[1]
    board[x][y] = curr
    
    if curr == m: # 찾음
        ans[0] = x+1
        ans[1] = y+1 
    
    curr -= 1  # 다음 수는 하나 감소 
    limit = pos[2] -1 # 다음 제한 값 

    
    if limit == 0: # 방향 전환 
        limits[direct] -= 2 # 방햔 전환 전 , 현재 방향 이동 제한 2 감소 
        direct = (direct+1) % 4  # 방향 전환 
        
        limit = limits[direct] # 현재 방향에 해당하는 이동 제한 수 가져옴 
            
    
    pos[0] = x + dx[direct] # 다음 x 방향 
    pos[1] = y + dy[direct] # 다음 y 방향 
    pos[2] = limit # 다음 움직임 제한 수  


for i in range(n):
    print(*board[i])
    
    
print(*ans)
    
    
    
    






