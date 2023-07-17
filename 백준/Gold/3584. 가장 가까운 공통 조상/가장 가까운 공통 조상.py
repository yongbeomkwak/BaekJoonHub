from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


def dfs(now,arr):
    global graph
    arr.append(now)
    
    for i in graph[now]:
        dfs(i,arr)

tc = int(input())

for _ in range(tc):
    n = int(input())
    graph = [[] for _ in range(n+1)]
    
    for _ in range(n-1):
        a,b = map(int,input().split())
        graph[b].append(a) # 자신의 부모를 담는다
        
    
    v,e = map(int,input().split())
    a = []
    b = []
    dfs(v,a)
    dfs(e,b)
    ans = inf
    
    for inter in (set(a) & set(b)): #서로 교집합을 구한후 
        ans = min(ans,a.index(inter)) # 인덱스가 적은 것이 가장 가까운 공통 조상을 가르키는 인덱스
    
    print(a[ans])