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
    coins = list(map(int,input().split()))
    m = int(input())
    dp = [0 for _ in range(10001)]
    dp[0] = 1
    
    for coin in coins:
        for i in range(coin,m+1):
            dp[i] += dp[i-coin]
    
    print(dp[m])
    