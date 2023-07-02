from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


  

n = int(stdin.readline()[:-1])


check = defaultdict(int)

for _ in range(n):
    name = stdin.readline()[:-1]
    
    check[name] += 1


for _ in range(n-1):
    
    name = stdin.readline()[:-1]
    
    check[name] -= 1
    if(check[name] == 0):
        del check[name]
    

print(*check)
    
    