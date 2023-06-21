from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *


n = int(stdin.readline()[:-1])

stream = list(map(int,stdin.readline()[:-1].split()))

arr = deque(((i+1,stream[i])  for i in range(len(stream))))

ans = []


for _ in range(n):
    #print(arr)
    index,move = arr.popleft()
    
    ans.append(index)
    dir = -move
    
    dir =  dir +1 if dir < 0 else dir
    
    arr.rotate(dir)
    


print(*ans)
    

    



    
