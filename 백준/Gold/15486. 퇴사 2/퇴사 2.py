from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

arr = [[0,0]]

dp = [0 for _ in range(n+1)]
for _ in range(n):
    arr.append(list(map(int,input().split())))


for i in range(1,n+1):
    dp[i] = max(dp[i],dp[i-1]) # 현재 최댓값을 구한 후
    
    t = arr[i][0]
    p = arr[i][1]
    
    
    
    fin_date = i + t - 1 # 현재일도 포함한 끝나는 날

    if  fin_date <= n: # 퇴사일 전 일 경우
        dp[fin_date] = max(dp[fin_date],dp[i-1] + p) # 현재 끝나는날 최대값 과  이전 최대값 + 현재일 했을 때 금액
        
print(max(dp))