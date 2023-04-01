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
     
        if s == "(" or s =="[": # 열리는 괄호면 담는다.
            stack.append(s)
            continue
        
        if s == "]" or s == ")": # 닫히는 괄호 일 때 
            if not(stack): # 스택이 빈 상태에 닫힌괄호가 먼저 나올 경우 잘못된 경우 ,반복문 종료
                stack.append(s)
                break
            
            if stack and isPair(stack[-1],s): # Piar면 쌍 제거
                stack.pop()
                continue
            
            stack.append(s) # 아닐경우 삽입
                

    if stack :
        stdout.write('no\n')
    else:
        stdout.write('yes\n')


    
    
