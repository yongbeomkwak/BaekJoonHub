from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

arr = list(map(int,input().split()))


arr.sort(reverse = True)

ans = arr[0]


for i in range(1,n):
    if ans / 2 + arr[i] > ans + arr[i] / 2 :
        ans = ans / 2 + arr[i]
    
    else:
        ans = ans + arr[i] / 2 

print("%.1f"%ans)
        