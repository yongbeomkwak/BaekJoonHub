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


sorted_arr = sorted(arr)
reversed_arr = sorted(arr,reverse=True)

M = -1

if n % 2 != 0:
    
    M = reversed_arr[0]
    
    for i in range(1,n):
        M = max(M,sorted_arr[i-1] + reversed_arr[i])
    
else:
   
    for i in range(1,n):
        M = max(M,sorted_arr[i] + reversed_arr[i])

print(M)