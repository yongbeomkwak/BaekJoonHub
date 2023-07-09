from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline

class Edge:

    
    def __init__(self,a,b,cost):
        self.a = a
        self.b = b
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




def union(a,b):
    global root
    pa = find(a)
    pb = find(b)
    
   
    if(pa<pb): # pa가 작으면 
        root[pb]=pa #pb의 부모를 pa로
    else:
        root[pa]=pb #pa의 부모를 pb
        

def find(a) -> int:
    
    global root
    
    #root 찾기
    r=root[a]
    while(r!=root[r]): #부모를 계속 접근
        r=root[r]
    #root 찾음

    #path compression(시간 복잡도를 나중에 갈수록 줄이기 위해)
    c:int=a
    while(c!=root[c]): #root 도달 전까지
        pc=root[c] # 현재 c의 부모를 가르킴
        root[c]=r # c의 부모를 위에서 구한 최상위 root를 가르킴
        c=pc #c를 부모로 옮김

    return r
    
    
    
    
    
    
    

v,e = map(int,input().split())

root = [i for i in range(v+1)] # i노드의 부모노드

heap = []

for _ in range(e):
    a,b,cost = map(int,input().split())
    heappush(heap,Edge(a,b,cost))



ans = 0

while heap:
    
    edge = heappop(heap)
    
    a = edge.a
    b = edge.b
    c = edge.cost
    
    if find(a) != find(b):
        union(a,b)
        ans += c
        
        
        
    
print(ans)


