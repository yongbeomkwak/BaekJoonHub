from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n,k = map(int,input().split())

arr = list(map(int,input().split()))


heightGap = []

for i in range(1,n):
    heightGap.append(arr[i] - arr[i-1])
    

heightGap.sort(reverse=True)
print(sum(heightGap[k-1:]))
        

    
    