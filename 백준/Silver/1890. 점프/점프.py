from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

board = []
dp = [[0] * n for _ in range(n)]

for _ in range(n):
    board.append(list(map(int,input().split())))



dp[0][0] = 1

for y in range(n):
    for x in range(n):
        
        ny = y + board[y][x]
        nx = x + board[y][x]
        if board[y][x] != 0:
            if ny < n: #아래로 
                dp[ny][x] += dp[y][x] 
            
            if nx < n: #오른쪽으로 이동
                dp[y][nx] += dp[y][x]
            

print(dp[n-1][n-1])