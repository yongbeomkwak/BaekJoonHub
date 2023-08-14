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
mine = [list(input()[:-1]) for _ in range(n)]
board = [list(input()[:-1]) for _ in range(n)]
result = [['.'] * n for _ in range(n)]

dx = [-1,-1,-1,0,0,1,1,1] #위 , 중간  ,  아래 
dy = [-1,0,1,-1,1,-1,0,1] # 왼 중간 , 오 

for x in range(n):
    for y in range(n):
        
        if mine[x][y] == "." and board[x][y] == "x": # 지뢰 없고 펼쳤다면
            mine_count = 0 
            
            for k in range(8):
                nx = x + dx[k]
                ny = y + dy[k]
                
                if nx >= n or nx < 0 or ny >= n or ny < 0: #범위 벗어남
                    continue
                
                if mine[nx][ny] == "*":
                    mine_count += 1 
            
            
            result[x][y] = str(mine_count)
                
        
        
        if mine[x][y] == "*" and board[x][y] == "x": # 지뢰 있고 펼쳤다면
            
            for i in range(n):
                for j in range(n):
                    if mine[i][j] == "*":  # 지뢰가 있는 칸 모두 공개 
                        result[i][j] = "*"
        
                
        

for i in range(n):
    print("".join(result[i]))

    
    
    