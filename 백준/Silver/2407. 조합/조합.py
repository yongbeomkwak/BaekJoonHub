from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


dp = [[0] * 101 for _ in range(101)] # dp[n][m] = nCm

n,m = map(int,input().split())

for i in range(1,n+1):
    dp[i][1] = i # nC1 = n
    dp[i][i] = 1 # nCn = 1 

for i in range(2,n+1):
    for j in range(2,m+1):
        dp[i][j] = dp[i-1][j-1] + dp[i-1][j]  # nCr = n-1Cr-1 + n-1Cr


print(dp[n][m])


