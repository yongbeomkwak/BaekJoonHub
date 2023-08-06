from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

n , m = map(int,input().split())

dots = list(map(int,input().split()))

dots.sort()

def dot_min(point):  # 선분 중 가장 작은 점 구하기 
    start = 0
    end = n - 1
    while start <= end:
        mid = (start + end) // 2

        if dots[mid] < point:
            start = mid + 1
        else:
            end = mid - 1
    return end + 1


def dot_max(point):   # 선분 중 가장 큰 점 구하기
    start = 0
    end = n - 1
    while start <= end:
        mid = (start + end) // 2

        if point < dots[mid]:
            end = mid - 1
        else:
            start = mid + 1
    return end
    
    
        
for _ in range(m):
    start,end = map(int,input().split())

    print(dot_max(end) - dot_min(start) +1)

