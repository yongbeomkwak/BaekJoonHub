from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n , k = map(int,input().split())

dp = [0 for _ in range(10001) ]

coins = []

for _ in range(n):
    c =  int(input())
    coins.append(c)


dp[0] = 1

for i in range(n):
    
    for j in range(coins[i],k+1):
        
        dp[j] += dp[j - coins[i]];

print(dp[k])
    