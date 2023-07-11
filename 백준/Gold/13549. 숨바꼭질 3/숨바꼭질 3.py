from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline

INF = 1000001

n,k = map(int,input().split())


dist = [inf for _ in range(INF)]
visited = [False for _ in range(INF)]


heap = []

dist[n] = 0
heappush(heap,(0,n))
while heap:
    
    head = heappop(heap)
    currDist = head[0]
    currPos = head[1]
    
    
    if currPos == k:
        break
    
    if visited[currPos]:
        continue
    
    visited[currPos] = True
    
    right = currPos + 1
    left = currPos - 1
    warp = 2 * currPos
    
    if warp < INF and dist[warp] > currDist +1:
        dist[warp] = currDist
        heappush(heap,(dist[warp],warp))
    
    if left >=0 and dist[left] > currDist + 1:
        dist[left] = currDist + 1
        heappush(heap,(dist[left],left))
    
    if right < INF and dist[right] > currDist +1:
        dist[right] = currDist + 1
        heappush(heap,(dist[right],right))
    



print(dist[k])
    


