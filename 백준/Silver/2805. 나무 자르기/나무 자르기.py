from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


arr = [1,2,3,4,5]

n,m = map(int,input().split())

trees = list(map(int,input().split()))


trees.sort()

lo = 0 
hi = trees[-1]

ans = 0

while lo <= hi:
    
    mid = (lo+hi) // 2
    
    _sum = 0 
    for tree in trees:
        if tree > mid:
            _sum += (tree - mid)
     #mid가 커지면 _sum은 감소
    if _sum  < m:  # sum이 작으면 , 커져야 하므로 mid는 작아져야함
        hi = mid -1
    
    else:
        ans = max(ans,mid)
        lo = mid + 1


print(ans)