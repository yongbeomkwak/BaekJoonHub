from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

C, N = map(int, input().split()) # C - 적어도 얻고자 하는 이득 이 때 최소 비용 구하기
hotel=[[0,0]] #cost, benefit
for i in range(N):
    line= list(map(int, input().split()))
    hotel.append(line)

maxCost = float('INF')
dp= [maxCost for _ in range(C+100)]
dp[0]=0

for i in range(1, N+1):
    cost = hotel[i][0]
    benefit = hotel[i][1]
    
    for j in range(benefit, C+100):    
        dp[j] = min(dp[j], dp[j-benefit]+cost)
        
# print(dp)     
print(min(dp[C:]))