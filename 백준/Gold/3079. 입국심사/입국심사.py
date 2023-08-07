from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n , m = map(int,input().split())
times = []

for _ in range(n):
    times.append(int(input()))

times.sort()

lo = 0
hi = times[-1] * m

t = inf

while lo <= hi:
    mid = (lo+hi) // 2
    
    _pass = 0 
    
    for time in times:
        _pass += mid // time
    # 현재 mid 시간 동안 처리 가능한 고객 수
  
    
    if _pass < m: # 해당 고객 수가 친구 수 m  보다 적으면
        lo = mid +1
        
    else:
        t = min(t,mid)
        hi = mid -1 

print(t)
    


        
    
    
    