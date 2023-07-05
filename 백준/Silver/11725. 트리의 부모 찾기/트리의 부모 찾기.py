from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


n = int(stdin.readline()[:-1])

adj = [[] for _ in range(n+1)]


visited = [ False for _ in range(n+1)]


for i in range(n-1):
    
    v,w = map(int,stdin.readline()[:-1].split())
    adj[v].append(w)
    adj[w].append(v)


q = deque()
visited[1] = True
q.append(1)

parents = [0 for _ in range(n+1)]


while q :
    
    parent = q.popleft()
    
    
    for nxt in adj[parent]:
        
        if not visited[nxt]:
            visited[nxt] = True
            q.append(nxt)
            parents[nxt] = parent 


for i in range(2,n+1):
    print(parents[i])


    




