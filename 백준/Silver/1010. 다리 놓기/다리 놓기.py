from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline



tc = int(input())

for _ in range(tc):


    MAX = 30
    n , m = map(int,input().split())
    
    dp = [ [0] * MAX for _ in range(MAX)] #dp[n][m] = mCn
    
    for i in range(0,MAX):
        dp[i][i] = 1 # iCi = 1
        dp[1][i] = i # iC1 = i
  
    
    # 파스칼의 삼각형에 의거하여
    # jCi = j-1 C i-1 + j-1 C i
    
    for i in range(2,n+1):
        for j in range(2,m+1):
            dp[i][j] = dp[i-1][j-1] + dp[i][j-1]
    
    
    print(dp[n][m])