from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


n , m = map(int,input().split())

edges =  [0  for _ in range(n+1)]

graph = [[] for _ in range(n+1)]

ans = [0 for _ in range(n+1)]

for _ in range(m):
    a ,b = map(int,input().split())
    graph[a].append(b)
    edges[b] += 1

q = deque()


for i in range(1,n+1):
    if edges[i] == 0 :
        q.append((i,1))
        ans[i] = 1




while q:
    subject,prevSemester = q.popleft()
    
    
    for nxt in graph[subject]:
        
        edges[nxt] -= 1
        
        if edges[nxt] == 0:
            ans[nxt] = prevSemester + 1
            q.append((nxt,prevSemester+1))
    


print(*ans[1:])



    




