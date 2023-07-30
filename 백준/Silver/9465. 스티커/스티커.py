from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


tc = int(input())

for _ in range(tc):
    n = int(input())
    score = []
    for _ in range(2):
        score.append([0] + list(map(int,input().split())))

    dp = [[0 for _ in range(n+1)] for _ in range(2)]
    
    dp[0][1] = score[0][1]
    dp[1][1] = score[1][1]
    
    for i in range(2,n+1):
        dp[0][i] = max(dp[1][i-2],dp[1][i-1]) + score[0][i]
        dp[1][i] = max(dp[0][i-1],dp[0][i-2]) + score[1][i]
    
    
    
    print(max(dp[0][n],dp[1][n]))