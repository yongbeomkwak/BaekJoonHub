from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n  = int(input())

rope = []

for _ in range(n):
    rope.append(int(input()))
    
rope.sort()

max_weight = 0 

for i in range(n):
    max_weight = max(max_weight,rope[i] * (n - i))
    

print(max_weight)
