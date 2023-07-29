from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n , k =  map(int,input().split())

arr = [0] + list(map(int, input().split()))
dp = [[0 for _ in range(k+1)] for _ in range(n+1)]

for i in range(1,n+1):
    
    arr[i] %= 2
    for j in range(k+1):
        
        if arr[i] == 0: # 짝수
        
            dp[i][j] = dp[i-1][j] + 1 # 이전 값 + 1
        
        if j != 0 and arr[i]: #홀수일 때 

            dp[i][j] = dp[i-1][j-1] # 이전(i-1) j-1값 그대로 이어 받음 
        
    
    

result = []
for i in dp:
    result.append(i[k])    

print(max(result))