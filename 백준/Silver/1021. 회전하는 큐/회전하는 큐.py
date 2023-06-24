from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *







n,m = map(int,stdin.readline()[:-1].split())

arr = list(map(int,stdin.readline()[:-1].split()))

q = deque([i for i in range(1,n+1)])

ans = 0


for i in range(m):
    target = arr[i]
    
    
    if q and target == q[0]:
        q.popleft()
    
    else:
    
        left_length = q.index(target)
        right_length = len(q) - left_length - 1
        
#        print(f"{ans},{q},{left_length},{right_length}")
        
        if left_length <= right_length:
            ans += left_length
            q.rotate(-left_length)
        
        else:
            ans += (right_length + 1)
            q.rotate(right_length + 1)
        
        q.popleft()

print(ans)
        
    
   
        
    
