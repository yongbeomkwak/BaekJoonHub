from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *


n = int(stdin.readline()[:-1])

NO = "NO"

flag = False
curr = 1 

stack = []
ans = []

for _ in range(n):
    m = int(stdin.readline()[:-1])
    
    while curr <= m:
        stack.append(curr)
        ans.append("+")
        curr += 1
        
    if stack[-1] == m:
        stack.pop()
        ans.append("-")
    
    else:
        flag = True
        break

    

if flag:
    print(NO)

else :
    for s in ans:
        print(s)
        