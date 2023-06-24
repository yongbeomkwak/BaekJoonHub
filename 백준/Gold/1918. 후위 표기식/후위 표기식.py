from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *



ju = (stdin.readline()[:-1])

ans = ""
stack = []
for s in ju:
    if s.isalpha():
        ans += s
        
    else:
        if s == "(":
            stack.append(s)
        
        elif s == ")":
            while stack and stack[-1] != "(":
                
                 ans += stack.pop()
                    
            stack.pop() # ( 버리기
        
        elif s == "*" or s == "/":
            while stack and (stack[-1] == "*" or stack[-1] == "/"): # 이전 곱,나누기 연산자 먼저 붙히기
                ans += stack.pop()
            
            stack.append(s)
                
        
        elif s == "+" or s == "-":
            while stack and stack[-1] != "(":
                ans += stack.pop()
            
            stack.append(s)
            

while stack:
    ans += stack.pop()
        
print(ans)


      
