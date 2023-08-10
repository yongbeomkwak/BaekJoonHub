from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n,m = map(int,input().split())

arr = []

dp = [[[100001] * 3 for _ in range(m)] for _ in range(n)]


for i in range(n):
    arr.append(list(map(int,input().split())))
    if i == 0:
        for j in range(m):
            dp[0][j][0] = arr[i][j]
            dp[0][j][1] = arr[i][j]
            dp[0][j][2] = arr[i][j]
# dp[i][j] = i행 j열 0:왼쪽 아래로 , 1: 바로 아래로 , 2: 오른쪽 아래로 

for i in range(1,n):
    for j in range(m):
        if j == 0:
            dp[i][j][2] = min(dp[i-1][j+1][0],dp[i-1][j][1]) + arr[i][j]
            dp[i][j][1] = dp[i-1][j+1][0] + arr[i][j] 
        
        elif j == m-1:
            dp[i][j][1] = dp[i-1][j-1][2] + arr[i][j]
            dp[i][j][0] = min(dp[i-1][j][1],dp[i-1][j-1][2]) + arr[i][j]
        
        else:
            dp[i][j][0] = min(dp[i-1][j][1],dp[i-1][j-1][2]) + arr[i][j]
            dp[i][j][1] = min(dp[i-1][j+1][0],dp[i-1][j-1][2]) + arr[i][j]
            dp[i][j][2] = min(dp[i-1][j+1][0],dp[i-1][j][1]) + arr[i][j]

ans = inf

for j in range(m):
    ans = min(ans,dp[n-1][j][0],dp[n-1][j][1],dp[n-1][j][2])

print(ans)
