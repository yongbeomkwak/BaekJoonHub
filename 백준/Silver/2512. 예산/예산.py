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
m = int(input())


arr.sort()
ans = 0
lo = 0
hi = arr[-1]

while lo<=hi:
    
    total = 0
    mid = (lo+hi) // 2
    
    for cost in arr:
        if cost < mid:
            total += cost
        else:
            total += mid

    if m < total:
        hi = mid-1
        
    else:
        ans = mid
        lo = mid + 1
        
print(ans)