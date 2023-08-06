from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


k,n = map(int,input().split())

cables = []

for _ in range(k):
    cables.append(int(input()))


lo = 1
hi = max(cables)

ans = 0 
while lo <=hi:
    
    mid = (lo+hi) // 2
    cnt = 0
    
    for cable in cables:
        cnt += cable // mid 
    
    if cnt < n: # mid가 줄어야 cnt가 커짐 -> hi가 줄어야 함
        hi = mid -1 
    
    else:
        ans = max(ans,mid)
        lo = mid +1

print(ans)
        
    
    
    