from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n,m = map(int,input().split())
area = [[0 for _ in range(m+1)]]

for _ in range(n):
    area.append([0]+list(map(int,input().split())))

dp = [[0]*(m+1) for _ in range(n+1)]
for i in range(1,n+1):
    for j in range(1,m+1):
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + area[i][j] # 바로 위 + 바로 왼쪽 - 왼쪽위 대각선 + 현재 

for _ in range(int(input())):
    x,y,x2,y2 = map(int,input().split())
    
    x -=1
    y -=1

    print(dp[x2][y2] - dp[x][y2] - dp[x2][y] + dp[x][y]) 