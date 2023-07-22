from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n  = int(input())

tips = []

ans = 0


for _ in range(n):
    
    tips.append(int(input()))
    

tips.sort(reverse = True)



for i in range(n):
    
    if tips[i] - i > 0 :
        ans += tips[i] - i

print(ans)
