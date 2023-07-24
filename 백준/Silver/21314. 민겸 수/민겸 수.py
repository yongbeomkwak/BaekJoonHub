from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline

#.      MAX.      MIN
# MM    11.       10
# MK    50        15 
# KM    51
# KK 

s = input()[:-1]

M = ""
m = ""

tmp = ""

for c in s:
    
    if c == "K":
        
        if len(tmp) > 0:
            M += str(int(pow(10,len(tmp)) * 5))
            m += str(int(pow(10,len(tmp)-1))) + "5"
        
        else:
            M += "5"
            m += "5"
        
        tmp = ""
    
    else:
        tmp += "M"


if tmp:
    M += "1" * len(tmp)
    m += "1" + "0" * (len(tmp) -1)

print(M)
print(m)
    
    