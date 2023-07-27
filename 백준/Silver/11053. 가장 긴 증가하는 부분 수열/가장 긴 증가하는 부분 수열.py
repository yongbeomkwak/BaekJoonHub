from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

arr = list(map(int,input().split()))

dp = [1] * 1001


ans = 1

for i in range(n):
    for j in range(i+1):
        if arr[i] > arr[j]:
            dp[i] = max(dp[i],dp[j]+1)
    
    
    ans = max(ans,dp[i])

print(ans)
    