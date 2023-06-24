from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *



n = int(stdin.readline()[:-1])


ans = 0

for _ in range(n):
    words = stdin.readline()[:-1]
    
    if len(words) % 2 != 0:
        continue
    
    stk = []

    for s in words :
        
        if stk and stk[-1] == s:
            stk.pop()
        
        else:
            stk.append(s)
        
    
    if not stk:
        ans += 1

print(ans)