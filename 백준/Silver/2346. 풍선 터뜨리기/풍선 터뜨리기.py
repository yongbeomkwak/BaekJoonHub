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
    
    dir =  dir +1 if dir < 0 else dir #  음수 일 때 1을 더하는 이유는 위에서 pop으로 뺐기때문에 이미 한번 이동한 것
    
    arr.rotate(dir)
    
    # rotate(n) 
    # n > 0 일경우 오른쪽으로 밈(헤더 기준 왼쪽으로 이동 하는 느낌)
    # n < 0 일경우 왼쪽으로 밈(헤더 기준 오른쪽으로 이동 하는 느낌)


print(*ans)
    

    



    
