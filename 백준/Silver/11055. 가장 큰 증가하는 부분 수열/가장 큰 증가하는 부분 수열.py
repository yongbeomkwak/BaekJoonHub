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

dp = [0 for _ in range(n)]

ans = 0

for i in range(n): # 0,1,2,3,4,5. 
    
    dp[i] = arr[i]
    for j in range(i):
        
        if arr[i] > arr[j] : # 증가하는 수열
            dp[i] = max(dp[i],dp[j] + arr[i])
    
    ans = max(dp[i],ans)

print(ans)

