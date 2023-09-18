from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline



n = int(input())

graph = [[] for _ in range(n)]

arr = list(map(int,input().split()))
k = int(input())

for i,parent in enumerate(arr):
    
    if parent == -1 or i == k: # 루트 이거나 제거할 노드 일 경우 그래프에 등록하지 않는다.
        continue
    
    graph[parent].append(i)

remove = []
remove.append(k)


while remove: # k와 연결된 모든 그래프는 -2(제거값)
    
    now = remove.pop()
    arr[now] = -2
    
    
    for nxt in graph[now]:
        if arr[nxt] != -2:
            remove.append(nxt)


ans = 0


for i in range(n):
    
    if arr[i] != -2 and not graph[i]: # 제거된 값이 아니고 자식이 없으면 , 리프 노드
        ans += 1

        
print(ans)