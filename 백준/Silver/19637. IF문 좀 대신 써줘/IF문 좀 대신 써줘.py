from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n , m = map(int,input().split())

_hasp = dict()

rank = []

for _ in range(n):
    medal,val = input().split()
    rank.append((medal,int(val)))

for _ in range(m):
    number = int(input())
    left = 0
    right = n-1
    ans = ""
    
    while left <= right:
        mid = (left+right) // 2
        
        if  rank[mid][1] >= number:
            right = mid -1 
            ans = rank[mid][0]
            
        else:
             left = mid + 1 

    print(ans)
        
    