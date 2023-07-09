from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline

class Edge:

    
    def __init__(self,a,b,cost):
        self.src = a
        self.dest = b
        self.cost = cost
        

    def __lt__(self, other): # x < y 를 판단하는 기준을 정의 (less than → lt)
        return self.cost < other.cost
    # def __le__(self, other): # x ≤ y 를 판단하는 기준을 정의 (less than or equal to → le)
    #     return self.cost <= other.cost
    # def __gt__(self, other): # x > y 를 판단하는 기준을 정의 (greater than → gt)
    #     return len(self) > len(other)
    # def __ge__(self, other): # x ≥ y 를 판단하는 기준을 정의 (greater than or equal to → ge)
    #     return len(self) >= len(other)
    # def __eq__(self, other): #  x == y 를 판단하는 기준을 정의 (equal to → eq)
    #     return len(self) == len(other)
    # def __ne__(self, other):  x == y 를 판단하는 기준을 정의 (equal to → eq)
    #     return len(self) != len(other)

    
    

n = int(input())
m = int(input())
ans = 0
visited = [False for _ in range(n+1)]
graph = [ [] for _ in range(n+1)]
heap = []

for _ in range(m):
    a,b,c = map(int,input().split())
    graph[b].append(Edge(b,a,c))
    graph[a].append(Edge(a,b,c))



heappush(heap,Edge(0,1,0))


while heap:
    
    top = heappop(heap)
    dest = top.dest
    cost = top.cost
    
    if visited[dest]:
        continue
    
    visited[dest] = True
    ans += cost
    
    for nxt in graph[dest]:
        
        if visited[nxt.dest]:
            continue
        
        heappush(heap,nxt)
  

print(ans)     
        
    
    
    
    



    





