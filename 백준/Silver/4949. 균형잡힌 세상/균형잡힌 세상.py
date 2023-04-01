from sys import *
from collections import *
import heapq


def isPair(s1:str,s2:str) -> bool :
    
    if s1 == "(" and s2 == ")":
        return True
    
    if s1 == "[" and s2 == "]":
        return True
    
    return False
    


while True:
    input = stdin.readline()[:-1]
    if input == ".":
        break
    
    stack = []
    for s in input:
     
        if s == "(" or s =="[":
            stack.append(s)
            continue
        
        if s == "]" or s == ")":
            if not(stack):
                stack.append(s)
                break
            
            if stack and isPair(stack[-1],s):
                stack.pop()
                continue
            
            stack.append(s)
                
    
        
            
    
    if stack :
        stdout.write('no\n')
    else:
        stdout.write('yes\n')


    
    