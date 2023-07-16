from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


def dfs(now,w):
    global graph
    
    for (nxt,cost) in graph[now]:
        
        if dist[nxt] == -1:
            dist[nxt] = w + cost
            dfs(nxt,dist[nxt])
    
    
    

n = int(input())
graph =[[] for _ in range(n+1)]

for _ in range(n-1):
    p,c,w = map(int,input().split())
    graph[p].append((c,w))
    graph[c].append((p,w))


dist = [-1 for _ in range(n+1)]
dist[1] = 1

dfs(1,0) # 루트에서 dfs  진행 후, 가장 먼 지점 찾아 낸 후

start = dist.index(max(dist))
dist = [-1 for _ in range(n+1)]

# 그 지점을 기준으로 다시 dfs 돌려 지름을 구한다
dist[start] = 0
dfs(start,0) 

print(max(dist))




    
