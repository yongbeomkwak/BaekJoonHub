from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

n , k = map(int,input().split())

s = list(map(int,input().split()))
d = list(map(int,input().split())) 

for _ in range (k):
    tmp = [0 for _ in range(n)]
    
    for i,v in enumerate(s):
        tmp[d[i]-1] = v  # 임시 배열에 해당 s 배열의 값을  이전 배치를 넣어준다.
    
    s = tmp

print(*s)
    




