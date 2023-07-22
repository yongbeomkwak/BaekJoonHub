from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline



s = list(input()[:-1])

n = len(s)



for i in range(n):
    
    
    if "".join(s[i:i+4]) == "XXXX":
        s[i] = "A"
        s[i+1] = "A"
        s[i+2] = "A"
        s[i+3] = "A"
    
    elif "".join(s[i:i+2]) == "XX":
        s[i] = "B"
        s[i+1] = "B"


print( -1  if "X" in s else "".join(s) )

