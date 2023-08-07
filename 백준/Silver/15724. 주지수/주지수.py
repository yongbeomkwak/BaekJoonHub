from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n,m = map(int,input().split())

board = []

dp = [[0 for _ in range(m)] for _ in range(n)]

for i in range(n):
    board.append(list(map(int,input().split())))
    
    for j in range(m):
        if j == 0:
            dp[i][j] = board[i][j]
        
        else:
            dp[i][j] += board[i][j] + dp[i][j-1]

    
k = int(input())


for _ in range(k):
    x1,y1,x2,y2 = map(int,input().split())
    
    y1 -=1
    y2 -=1
    x1 -=1
    
    ans = 0
    for h in range(x1,x2):
        ans += dp[h][y2] - dp[h][y1] + board[h][y1] # y2까지 누적합 - y1까지 누적합 + 손실된 y1복구 
                                                    # (1,3) (1,5) , 5 4 3 2 1 - 3 2 1 , 3손실됨 + 3 
        
    print(ans)