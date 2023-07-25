from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

times = []

for _ in range(n):
    
    s, e = map(int,input().split())
    
    times.append([s,e])

times.sort()

heap = []

heappush(heap,[times[0][1],times[0][0]])

for s,e in times[1:]:
    
    fastEndTime = heap[0][0]
    
    if heap and fastEndTime <= s: # 다음 회의 이전에 끝나면 
        heappop(heap) # 다음 회의로 교체 , 강의실 증가 x

    heappush(heap,[e,s]) # 추가 회의실 배정 또는 기존 회의실에 배정


print(len(heap))



    
    