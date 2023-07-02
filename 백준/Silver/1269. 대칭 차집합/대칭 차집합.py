from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


   
            
nA,nB = map(int,stdin.readline()[:-1].split())


a = set(map(int,stdin.readline()[:-1].split()))
b = set(map(int,stdin.readline()[:-1].split()))


print( len(a-b) + len(b-a) )
        

