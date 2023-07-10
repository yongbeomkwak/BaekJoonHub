from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline



def find(a):
    global root
    
    r = root[a]
    
    while r != root[r]:
        r = root[r]
        
    
    c = a
    
    
    while c != root[c]:
        pc = root[c]
        root[c] = r
        c = pc
    
    return r
    
    
    

def union(a,b):
    global root
    
    pa = find(a)
    pb = find(b)
    
    if pa < pb:
        root[pb]= pa
    else:
        root[pa] = pb
    
    

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

    
    

n,m= map(int,input().split())
ans = 0
visited = [False for _ in range(n+1)]
graph = [ [] for _ in range(n+1)]
heap = []
root = [ i for i in range(n+1)]

for _ in range(m):
    a,b,c = map(int,input().split())
    heappush(heap,Edge(a,b,c))
    #graph[b].append(Edge(b,a,c))
    #graph[a].append(Edge(a,b,c))


selected = []  # 선택된 간선

while heap:
    
    head = heappop(heap)
    
    a = head.src
    b = head.dest
    c = head.cost
    
    if find(a) != find(b):
        union(a,b)
        ans += c
        selected.append(c)

print(ans - selected.pop())