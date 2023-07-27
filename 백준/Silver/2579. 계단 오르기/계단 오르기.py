from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

dp = [0 for _ in range(301)]
step = [0 for _ in range(301)]


for i in range(1,n+1):
    step[i] = int(input())

dp[1] = step[1]
dp[2] = step[1]+step[2]
dp[3] = max(step[1],step[2]) + step[3]


for i in range(4,n+1):
    
    dp[i] = max(dp[i-3] + step[i-1] ,dp[i-2])  +step[i] # i = 4 , (1,3) 비교 2 

print(dp[n])
