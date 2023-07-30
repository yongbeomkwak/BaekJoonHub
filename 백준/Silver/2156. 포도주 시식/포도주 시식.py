from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

wines = [0 for _ in range(10001)]

dp = [0 for _ in range(10001)]

for i in range(1,n+1):
    wines[i] = int(input())


dp[1] = wines[1]

dp[2] = dp[1] + wines[2] 


for i in range(3,n+1):
    dp[i] = max(dp[i-3]+wines[i-1],dp[i-2]) + wines[i] # 이번 잔을 마실 때 경우 <3번 전+ 직전 , 두번 째 전)
    dp[i] = max(dp[i-1],dp[i]) # 이번 것을 먹지 않을 경우 

print(dp[n])
    