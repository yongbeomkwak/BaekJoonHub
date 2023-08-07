from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

def step(i,j):
    global rocks
    
    return (j-i) * (1 + abs(rocks[i] - rocks[j]))

n = int(input())

rocks = list(map(int,input().split()))

lo = 0
hi = n * 1000000

k = inf 


while lo<=hi:
    
    
    visited = [False for _ in range(n)]
    visited[0] = True
    mid = (lo+hi) // 2
    
    flag = False
    
    stk = []
    stk.append(0)
    
    while stk:
        curr = stk.pop()
        
        if curr == n-1:
            flag = True
            break
        
        for nxt in range(curr+1,n):
            if visited[nxt] or step(curr,nxt) > mid: # 방문 했거나 드는 힘이 mid 보다 크면 넘어감
                continue
            
            visited[nxt] = True
            stk.append(nxt)
    
    
    if flag:
        k = min(k,mid)
        hi = mid - 1
    else:
        lo = mid +1 

print(k)
        
    
    
    