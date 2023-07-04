from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *






n = int(stdin.readline()[:-1])

visit = [False for _ in range(n+1)]
graph = [[]  for _ in range(n+1)]

m = int(stdin.readline()[:-1])

for _ in range(m):
    u,v = map(int,stdin.readline()[:-1].split())
    
    graph[u].append(v)
    graph[v].append(u)
    
stk = []
ans = 0 

if graph[1]:
    stk.append(1)
    
    while stk:
    
        curr = stk.pop()
     
      
        if not visit[curr]:
            visit[curr] = True
            ans += 1
            
            for nex in graph[curr]:
                stk.append(nex)
    
    print(ans -1) # 1 노드 빼기

else:
    print(0)

