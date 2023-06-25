from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *







n = int(stdin.readline()[:-1])

arr = list(map(int,stdin.readline()[:-1].split()))


result = [i for i in range(n,0,-1)]

q = deque()

for i in range(n-1,-1,-1):
    
    if arr[i] == 1 :
        q.appendleft(result[i])
    
    elif arr[i] == 2:
        q.insert(1,result[i])
        
    else:
        q.append(result[i])
        

print(*list(q))
        
    
   
        
    
