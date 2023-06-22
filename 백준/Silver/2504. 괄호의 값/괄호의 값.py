from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *


result = 0
tmp = 1
stream = list(stdin.readline()[:-1])

stack = []



# 1~4번째 과정 시작
for i in range(len(stream)):
    
    s = stream[i]
    
    if s == '(':
        
        tmp *= 2
        stack.append(s)
        
    elif s == '[':
        tmp *= 3
        stack.append(s)
        
    elif s == ')':
        if not stack or stack[-1]!='(':
          result = 0
          break
      
        if stream[i-1]=='(': 
            result += tmp
            
        tmp //= 2
        stack.pop()
        
    elif s == ']':
        
        if not stack or stack[-1]!='[':
          result = 0
          break
      
        if stream[i-1]=='[': 
            result += tmp
        
        tmp //= 3
        stack.pop()

if stack:
    print(0)

else:
    print(result)

    
