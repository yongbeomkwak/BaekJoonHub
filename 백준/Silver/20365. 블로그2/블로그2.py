from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

s = input()[:-1]

colors = { 'B' : 0, 'R' : 0 } #딕셔너리
colors[s[0]] +=1 #처음 색깔 칠하기
for i in range(1, n): #다른 색이 나오면 해당 색깔 칠하는 횟수 +1
    if s[i] != s[i-1]:
        colors[s[i]]+=1

result = min(colors['B'], colors['R'])+1 #칠할 횟수가 더 많은 것을 먼저 전체 칠하고(1) 칠할 횟수가 더 적은 것의 횟수 값(min)을 더한다.
print(result)


