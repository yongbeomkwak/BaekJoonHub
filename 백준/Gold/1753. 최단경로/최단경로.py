from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


v,e = map(int,input().split())
k = int(input())

dist = [inf for _ in range(v+1)]
graph = [[] for _ in range(v+1)]

heap = []
for _ in range(e):
    a,b,c = map(int,input().split())
    graph[a].append((b,c))
   
dist[k] = 0
heappush(heap,(0,k))
while heap:
    head = heappop(heap)
    cost = head[0]
    dest = head[1]
    
    for edge in graph[dest]:
        nxt = edge[0]
        nxtCost = edge[1]
        if dist[nxt] > dist[dest] + nxtCost :
            dist[nxt] = dist[dest] + nxtCost
            heappush(heap,(dist[nxt],nxt))


ans = ""

for i in dist[1:]:
    if(i == inf):
        ans += "INF\n"
    else:
        ans += f"{i}\n"

print(ans[:-1])

