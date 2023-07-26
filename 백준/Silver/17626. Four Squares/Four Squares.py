from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline



N = int(input())

dp = [0 for _ in range(N+1)]


dp[1] = 1

for i in range(2,N+1):
    j = 1
    m = 4 
    
    while(j**2 <= i):
        prev = dp[i - j**2]
        m = min(m,prev)
        j += 1
    
    dp[i] = m + 1

print(dp[N])

