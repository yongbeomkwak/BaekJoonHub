from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


n = int(stdin.readline()[:-1])


heap = []


for _ in range(n):
    
    m = int(stdin.readline()[:-1])
    
    if m == 0 :
        
        if heap:
            print(heappop(heap)[1])
        
        else:
            print(0)
            
    else:
        heappush(heap,(-m,m))

        
    
    


