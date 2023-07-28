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

dp[0] = arr[0]

ans = dp[0]

for i in range(1,n):
    
    dp[i] =   max(arr[i],dp[i-1] + arr[i]) # 현재 값을 첫 시작으로 할 것 인가 , 이전 누적값과 함께 같이 사용할 것인가 
    ans = max(dp[i],ans)

print(ans)

