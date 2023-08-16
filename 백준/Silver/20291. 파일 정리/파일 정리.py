from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

_hash = defaultdict(int)

for _ in range(n):
    file,extension = input()[:-1].split(".")
    _hash[extension] += 1
    
    


for key in sorted(_hash.keys()):
    print(key,_hash[key])


    
    






