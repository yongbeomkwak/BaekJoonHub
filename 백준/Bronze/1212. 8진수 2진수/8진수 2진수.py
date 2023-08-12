from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

tmp = string.hexdigits # 16진수 0123456789abcdefABCDEF
def convert(num, base) :
    a = num
    
    ret = ""
    
    while a!= 0:
        b = a // base
        m = a % base
        ret = tmp[m] + ret
        a = b 
    
    return ret

n = int(input(),8) # 8진수 -> 10 

print(bin(n)[2:])







