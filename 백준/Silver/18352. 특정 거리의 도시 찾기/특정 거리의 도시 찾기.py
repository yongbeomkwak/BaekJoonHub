from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


n,m,k,x = map(int,input().split())

visited = [False for _ in range(n+1)]
dist = [0 for _ in range(n+1)]
graph = [[] for _ in range(n+1)]


for _ in range(m):
    a,b = map(int,input().split())
    graph[a].append(b)
    
    
heap = []
ans = []
heappush(heap,(0,x))
while heap:
    now = heappop(heap)
    currDist = now[0]
    src = now[1]
    
    if visited[src]:
        continue
    
    visited[src] = True
    dist[src] = currDist
    
    if currDist == k:
        ans.append(src)
    
    for nxt in graph[src]:
        
        if not visited[nxt]:
            heappush(heap,(currDist+1,nxt))
    
ans.sort()
ret = ""
if ans:
    for i in ans:
        ret += str(i) +"\n"
    print(ret[:-1])
else :
    print(-1)


    





