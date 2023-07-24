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


s = input()[:-1]

M = ""
m = ""

tmp = ""

for c in s:
    
    if c == "K": 
        
        if len(tmp) > 0: # 이전에 쌓인 M이 1개 이상 일때 
            M += str(int(pow(10,len(tmp)) * 5)) # 최댓값은 5000 꼴
            m += str(int(pow(10,len(tmp)-1))) + "5" # 최솟값은 15 ,105 꼴 , 10^(m-1) + 5
        
        else: # K만 있을 때는 둘다 += 5
            M += "5"
            m += "5"
        
        tmp = ""
    
    else:
        tmp += "M"


if tmp: # M이 쌓인채로 반복문이 끝날 경우 
    M += "1" * len(tmp) #최댓값은 111 패턴 
    m += "1" + "0" * (len(tmp) -1)  #최솟값은 100000 꼴

print(M)
print(m)
