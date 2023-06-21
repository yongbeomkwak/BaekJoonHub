from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *


hmap = dict()

n = int(stdin.readline()[:-1])

stream = stdin.readline()[:-1]

for o in range(ord("A"),ord("A")+n): 
    nVal = int(stdin.readline()[:-1])
    hmap[chr(o)] = nVal

stack = []

for s in stream:
    
    if s.isalpha():
        stack.append(hmap[s])
    
    else: 
        a = stack.pop()
        b = stack.pop()

        if s == "+":
            stack.append(a+b)
        
        elif s == "-":
            stack.append(b-a)
        
        elif s == "*":
            stack.append(a*b)
        
        else :
            stack.append(b/a)
            
    
print('%.2f' %stack[-1])
            
    



    
