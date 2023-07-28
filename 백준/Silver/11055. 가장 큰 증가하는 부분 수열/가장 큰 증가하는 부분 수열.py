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

for i in range(n): 
    
    dp[i] = arr[i] # 해당 i 첫 시작은 자기자신 값 
    for j in range(i):
        
        if arr[i] > arr[j] : # 증가하는 수열
            dp[i] = max(dp[i],dp[j] + arr[i])
    
    ans = max(dp[i],ans)

print(ans)

