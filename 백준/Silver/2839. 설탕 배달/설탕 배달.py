from sys import *
from collections import * 
from heapq import * 
from functools import *


MAX = 5001 

dp = [-1 for _ in range(MAX)]

dp[3] = 1
dp[5] = 1

N = int(input())

for i in range(3,N+1):
    
    if(i - 3 <= 0 or i - 5 <= 0):
        continue
    
    if(dp[i-3] != -1):
        dp[i] =  dp[i-3] + 1 if dp[i] == -1 else min(dp[i-3]+1,dp[i])
    
    if (dp[i-5] != -1):
        dp[i] = dp[i-5] + 1 if dp[i] == -1 else min(dp[i-5]+1,dp[i])
    
    
    
    

print(dp[N])







