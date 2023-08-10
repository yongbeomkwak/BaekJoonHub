from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

t = int(input())
k = int(input())

coins = []

for _ in range(k):
    p,n = map(int,input().split())
    coins.append([p,n])
    

dp = [0] *(t+1)

dp[0] = 1
for cost,num in coins:
    for money in range(t,0,-1):
        for i in range(1,num+1):
            if money - cost * i >= 0:
                dp[money] += dp[money - cost *i]

print(dp[t])