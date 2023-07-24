from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())


times = [[0] * 2 for _ in range(n)]

for i in range(n):
    times[i][0] , times[i][1] = map(int,input().split())
    

times.sort(key = lambda t : (t[1] ,t[0])) # 끝나는 시간 기준

end_time = times[0][1]
cnt = 1


for i in range(1,n):
    s , e = times[i]
    
    if end_time  <= s : # 현재 회의 끝나는 시간이 <= 다음 회의 시작 시간 , 다음회의 가능 
        cnt += 1
        end_time = e


print(cnt)


    
    