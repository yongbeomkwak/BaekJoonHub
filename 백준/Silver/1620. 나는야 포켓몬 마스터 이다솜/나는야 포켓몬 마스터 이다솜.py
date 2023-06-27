from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *



n, m = map(int,stdin.readline()[:-1].split())

dict1 = defaultdict(str)
dict2 = defaultdict(int)

for i in range (1,n+1):
    pocket = stdin.readline()[:-1]
    dict1[i] = pocket
    dict2[pocket] = i
    
for _ in range(m):
    request = stdin.readline()[:-1]
    if request.isdecimal():
        
        print(dict1[int(request)])
    else:
        print(dict2[request])
