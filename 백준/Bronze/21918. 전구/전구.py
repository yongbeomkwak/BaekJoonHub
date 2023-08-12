from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline


n , m = map(int,input().split())

bulbs = list(map(int,input().split()))


for _ in range(m):
    a,b,c = map(int,input().split())
    # a == 1 , b-1 번째 전구의 상태를 c로 변경
    # a == 2 , b-1 ~ c-1 전구 상태 반전
    # a == 3 , b-1 ~ c-1 전구 끔
    # a == 4 , b-1 ~ c-1 전구 켬
    
    if a == 1 :
        bulbs[b-1] = c
    
    elif a == 2:
        for i in range(b-1,c):
            bulbs[i] =  0 if bulbs[i] == 1 else 1
    
    elif a == 3:
        for i in range(b-1,c):
            bulbs[i] = 0
        
    else:
        for i in range(b-1,c):
            bulbs[i] = 1
    

print(*bulbs)




