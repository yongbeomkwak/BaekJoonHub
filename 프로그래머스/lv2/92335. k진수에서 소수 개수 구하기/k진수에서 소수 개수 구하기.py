from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
#input = stdin.readline

numbers = string.digits

def convert(n,base): #  n을 base진법
    
    a = n 
    ret = ""
    
    while a != 0:
        b = a // base
        c = a % base
        
        a = b
        ret = numbers[c] + ret
    
    return ret

def isPrime(n): # 소수 판별
    end = int(int(n)**0.5)+1
    
    if n == 1:
        return False
    
    if n == 2 or n == 3:
        return True
    
    
    for i in range(2,end+1):
        if n % i == 0:
            return False
    
    return True
    
    

def solution(n, k):
    answer = 0
    
    s = convert(n,k)
    
    s = s.split("0")
    
    for num in s:
        if num:
            if isPrime(int(num)):
                answer += 1

    return answer