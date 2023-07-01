from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


   
            
n = int(stdin.readline()[:-1])

maxH = []
minH = []
isRemain = defaultdict(bool)

for _ in range(n):
    p,l = map(int,stdin.readline()[:-1].split())
    
    heappush(maxH,(-l,-p))
    heappush(minH,(l,p))
    isRemain[p] = True
    
m = int(stdin.readline()[:-1])





for i in range(m):
    
    request = stdin.readline()[:-1].split()
    
    oper = request[0]

    if oper == "add":
        p = int(request[1])
        l = int(request[2])
        
         # 같은 번호의 다른 난이도 문제가 삽입되어 이미 죽은 문제인데 True로 나와 출력되는 것을 방지.
        
        while not isRemain[-maxH[0][1]]:
            heappop(maxH)
        while not isRemain[minH[0][1]]:
            heappop(minH)
            
        isRemain[p] = True
        heappush(maxH,(-l,-p))
        heappush(minH,(l,p))
        

    elif oper == "recommend":
        x = int(request[1])
        
        if x == 1:
            while maxH and not isRemain[-maxH[0][1]]:
                heappop(maxH)
            
            
            if maxH:
                l,p = maxH[0]
                print(-p)
            
        else :
            while minH and not isRemain[minH[0][1]]:
                heappop(minH)
            
            
            if minH:
                l,p = minH[0]
                print(p)
            
            
            
        
        
    else:
        p = int(request[1])
        
        isRemain[p] = False
        
        
        
        
        

