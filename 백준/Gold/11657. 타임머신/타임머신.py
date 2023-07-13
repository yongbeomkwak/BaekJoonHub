from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


n,m = map(int,input().split())
dist = [inf for _ in range(n+1)]
iscycle = False

graph = [[] for _ in range(n+1)]

for _ in range(m):
    a,b,c = map(int,input().split())
    graph[a].append((b,c))



def bellmanFord():
    global dist
    global iscycle
    
    dist[1] = 0 # 시작 지점
    for _ in range(1,n+1):
        for u in range(1,n+1):
            if dist[u] == inf:
                continue
        
            for v,cost in graph[u]:
                
                if dist[v] > dist[u] + cost:
                    dist[v] = dist[u] + cost
    
    
    # 사이클 체크
    for u in range(1,n+1):
            
        if dist[u] == inf:
            continue
            
        for v,cost in graph[u]:
            
            if dist[v] > dist[u] + cost:
                iscycle = True
                return

bellmanFord()        




if iscycle:
    print(-1)

else:
    
    for i in range(2,n+1):
        if dist[i] == inf:
            print(-1)
        
        else:
            print(dist[i])

