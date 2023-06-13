from sys import *
from collections import * 
from heapq import * 

N = int(input())

ans = 0

schedule = []

for _ in range(N):
    s,t = map(int,stdin.readline()[:-1].split())
    schedule.append((s,t))

sorted_schedule =  sorted(schedule)

heap = []
heappush(heap,(sorted_schedule[0][1],sorted_schedule[0][0]))


#heap = (종료시간,시작시간)

for s,t in sorted_schedule[1:]:
    
    if len(heap) != 0 and s < heap[0][0]: #현재 강의 시작 시간 < 가장빠른 강의 종료 시간 
        heappush(heap,(t,s))
    else :
        heappop(heap)
        heappush(heap,(t,s))
        
    
print(len(heap))

    






