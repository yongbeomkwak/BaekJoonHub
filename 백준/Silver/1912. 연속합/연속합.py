from sys import *
from collections import * 
from heapq import * 
from functools import *




n = int(stdin.readline()[:-1])

arr = list(map(int,stdin.readline()[:-1].split()))

LMIT = 100000
dp = [ 0  for _ in range(LMIT)]



dp[0] = arr[0]

ans = dp[0]

for i in range(1,n):
    dp[i] = max(dp[i-1] + arr[i],arr[i])
    ans = max(dp[i],ans)

print(ans)










