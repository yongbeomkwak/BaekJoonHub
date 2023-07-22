from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n  = int(input())

bucket = []

for _ in range(n):
    bucket.append(int(input()))

bucket.sort(reverse = True)

ans = 0

for i in range(0,n,3):

    ans += sum(bucket[i:i+2])

print(ans)
