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


for _ in range(n-1):
    arr.append(list(map(int,input().split())))

for i in range(2,n+1): # 슈퍼점프롤 제외한 최솟값 구함
    
    if i < 3:
        dp[i] = dp[i-1]+arr[i-1][0]
    
    else:
        dp[i] = dp[i-1] + arr[i-1][0]
        dp[i] = min(dp[i],dp[i-2] + arr[i-2][1])


k = int(input())


ans = 9999999

for x in range(1,n-2): #모든 구간 가장 큰 점프 적용
    dpcopy = dp[:]
    
    if dp[x] + k < dp[x+3]: #슈퍼점프 적용이 더  작을경우
        dpcopy[x+3] = dpcopy[x] + k # 적용 후 시뮬레이션 시작 
        
        for i in range(x+4,n+1): # x+4(슈퍼 점프 이후) 슈퍼점프 한 후 , 위 작업 반복
            dpcopy[i] = dpcopy[i-1] + arr[i-1][0]
            dpcopy[i] = min(dpcopy[i],dpcopy[i-2] + arr[i-2][1])
        
        
        ans = min(ans,dpcopy[-1])
        

if ans == 9999999:
    print(dp[-1])

else:
    print(ans)
