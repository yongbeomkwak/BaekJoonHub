from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *



n = int(stdin.readline()[:-1])
circles = []

for i in range(n):
    x , r = (map(int,stdin.readline()[:-1].split()))
    circles.append((x-r, i))
    circles.append((x+r, i)) 
    
circles.sort()

stk = []
for c in circles:
    if stk:
        if stk[-1][1] == c[1]:
            stk.pop()
        else:
            stk.append(c)
    else:
        stk.append(c) 
    
if stk:
    print('NO')
else:
    print('YES')



      
