from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


n = int(stdin.readline()[:-1])


heap = []

ret = ""

for _ in range (n):
    
    x = int(stdin.readline()[:-1])
    
    if x == 0:
        
        if heap:
            ret += str(heappop(heap)[1]) + "\n"
        
        else:
            ret += "0\n"
    
    else :
        heappush(heap,(abs(x),x))

print(ret[:-1])