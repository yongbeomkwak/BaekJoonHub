from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


tc = int(stdin.readline()[:-1])

empty = "EMPTY"

while tc:
    tc -= 1
    heap1 = [] #최소힙
    heap2 = [] #최대힙 
    
    
    t = int(stdin.readline()[:-1])
    
    isContain = [False for _  in range(t) ]
    
    for i in range(t):
        k,n = stdin.readline()[:-1].split()
        
        n = int(n)
        
        if k == "I":
            
            heappush(heap1,(n,i))
            heappush(heap2,(-n,i))
            
            isContain[i] = True
            
        elif n == 1: #최댓값 삭제
            
            while heap2 and not isContain[heap2[0][1]]: #현재 힙 최댓값이 이미 없는 값이면 계속 뺌
                heappop(heap2)
                
            if heap2: # 실제 있는 값 중 최댓값 찾음
                pos = heappop(heap2)[1]
                isContain[pos] = False
                
            
        else:
            
            while heap1 and not isContain[heap1[0][1]]: #현재 힙 최솟값이 이미 없는 값이면 계속 뺌
                heappop(heap1)
                
            if heap1: # 실제 있는 값 중 최솟값 찾음
                pos = heappop(heap1)[1]
                isContain[pos] = False
            
                
    
    while heap1 and not isContain[heap1[0][1]]: # 마찬가지로 없는 수 전부 제거
        heappop(heap1)
    while heap2 and not isContain[heap2[0][1]]: # 마마찬가지로 없는 수 전부 제거
        heappop(heap2)
        
    print(-heap2[0][0], heap1[0][0]) if heap1 and heap2 else print(empty)
            
            
            
            
            
            
    


