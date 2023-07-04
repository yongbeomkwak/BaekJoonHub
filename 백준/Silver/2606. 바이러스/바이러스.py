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
    
q = deque()
ans = 0 

if graph[1]:
    visit[1] = True
    q.append(1)


while q:
    curr = q.popleft()
    
    
    for nex in graph[curr]:
        
        if not visit[nex]:
            ans += 1
            visit[nex] = True
            q.appendleft(nex)

print(ans)   