from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n,r = map(int,input().split())

graph = [[] for _ in range(n+1)]

ans = [0,0]

isfind = False

dist = [inf for _ in range(n+1)]

for _ in range(n-1):
    a,b,d = map(int,input().split())
    graph[a].append((b,d))
    graph[b].append((a,d))


q = deque()

q.append((r,0))
dist[r] = 0
giga_node = -1

while q:
    head = q.popleft()
    curr = head[0]
    curr_dist = head[1]
    
    if r == curr and not isfind and len(graph[curr]) >=2 : # 루트는 자식밖에 없으므로 -1을 할 필요가 없음
        isfind = True
        ans[0] = curr_dist
        giga_node = curr
    
    
    elif r != curr and not isfind and len(graph[curr]) -1 >=2 : # 기가노드 조건, 첫등장(isfind), 자식 = (연결 갯수 -1(부모)) >= 2개 이상
        isfind = True
        ans[0] = curr_dist
        giga_node = curr
    
    for nxt,cost in graph[curr]:
        
        if dist[nxt] > curr_dist + cost:
            dist[nxt] = curr_dist + cost
            q.append((nxt,dist[nxt]))

ans[1] = max(dist[1:]) - ans[0] # 가장 먼 가지  = 길이 - 기가노드 거리 

if giga_node == -1: #기가 노드가 없을 때 , 리프 노드가 기가노드 
    print(*reversed(ans))
else:
    print(*ans)