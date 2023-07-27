from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

dp = [0 for _ in range(1001)]

dp[1] = 1
dp[2] = 3
DIV = 10007

for i in range(3,n+1):
    dp[i] = (dp[i-1] + (dp[i-2]) * 2 ) % DIV

print(dp[n])

