from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

def convertToInt(s):
    
    return int(s,2)

n,m = map(int,input().split())

a = 2 << 5

trains = [ "0" * 20  for _ in range(n)]


for _ in range(m):
    command = list(map(int,input().split()))
    
    oper = 0
    index = 0
    x = 20 
    
    if len(command) == 3 :
        oper,index,x = command
    
    else:
        oper,index = command
    
    
    index -=1
    curr = list(trains[index])
    x = 20 - x 
    if oper == 1: # 탑승

        curr[x] = "1"
        trains[index] = "".join(curr)

    
    elif oper == 2:# 하
        
        curr[x] = "0"
        trains[index] = "".join(curr)
        
    
    elif oper == 3:
        
        curr = curr[1:] + ["0"] #  k -> k +1  
        
        trains[index] = "".join(curr)
    
    else:
        
        curr = ["0"] + curr[:19]
        
        trains[index] = "".join(curr)
    
    

print(len(set(trains)))
    









