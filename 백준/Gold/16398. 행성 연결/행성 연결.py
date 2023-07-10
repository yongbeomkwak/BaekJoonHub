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
    
    def __str__(self):
        return f"{self.src} {self.dest} {self.cost}"

    
    
n = int(input())

heap = []

visited = [False for _ in range(n+1)]


graph = [[] for _ in range(n+1)]

for i in range(n):
    arr = list(map(int,input().split()))
    for j in range(len(arr)):
        graph[i].append(Edge(i,j,arr[j]))

        
ans = 0

heappush(heap,Edge(0,1,0))


while heap:
    head = heappop(heap)
    a = head.src
    b = head.dest
    c = head.cost
    
    if visited[b]:
        continue
    
    visited[b] = True
    ans += c
    
    for nxt in graph[b]:
        
        if visited[nxt.dest] or nxt.cost == 0:
            continue
        
        heappush(heap,nxt)
    
print(ans)
    
    



    





