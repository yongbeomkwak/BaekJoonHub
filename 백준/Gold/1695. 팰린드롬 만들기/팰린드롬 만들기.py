from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

dp = [[0 for _ in range(n+1)] for _ in range(n+1)]
arr = list(map(int,input().split()))



for i in range(1,n+1):
    for j in range(n):
        if arr[-i] == arr[j]: # 거꾸로 LCS 
            dp[i][j] = dp[i-1][j-1] + 1 
        
        else:
            dp[i][j] = max(dp[i-1][j],dp[i][j-1])


print(n-dp[n][n-1]) # LCS의 길이가 가장 길게 찾은 팰린드롬 , 그러므로 n - LCS 길이가 , 추가되야할 개수
