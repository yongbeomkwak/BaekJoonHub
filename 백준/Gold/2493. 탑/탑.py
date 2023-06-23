from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *



n = int(stdin.readline()[:-1])

towers = list(map(int,stdin.readline()[:-1].split()))

stack = []
answer = []

for i in range(n):
    
    curr = towers[i]
    
    while stack:
        top = stack[-1]
        if top[1] > curr : # 지나온 타워 높이가 크면 (수신가능)
            answer.append(top[0]+1)
            break
        else:
            stack.pop() # 수신 불가 
        
    if not stack: # 비어있으면 수신할 타워가 없음
        answer.append(0)
        
    stack.append([i, towers[i]])  # 인덱스, 값

print(*answer)       
