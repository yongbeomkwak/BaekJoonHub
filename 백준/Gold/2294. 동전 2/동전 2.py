from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n , k = map(int,input().split())

dp = [inf for _ in range(k+1) ]

coins = []

for _ in range(n):
    c =  int(input())
    coins.append(c)


dp[0] = 0

for coin in coins:
    for j in range(coin,k+1):
        dp[j] = min(dp[j],dp[j-coin]+1)
        


print( -1 if dp[k] == inf else dp[k] )
    