from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *







tc = int(stdin.readline()[:-1])


while tc:
    
    tc -=1
    cmd = stdin.readline()[:-1]
    
    left = []
    right = []
    
    for c in cmd:
        if c == "<":
            if left:
                right.append(left.pop())
            
        elif c == ">":
            if right:
                    left.append(right.pop())
            
        elif c == "-":
            if left:
                left.pop()
        else:
            left.append(c)
    
    left.extend(reversed(right))
    
    print("".join(left))
        
    
        
    
