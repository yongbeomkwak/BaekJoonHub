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

switches = [0] + list(map(int,input().split()))

m = int(input())

for _ in range(m):
    
    g,num = map(int,input().split())
    
    if g == 1 :
        
        for i in range(num,n+1,num):
            switches[i] =  0 if switches[i] == 1 else 1 # 반전
    
    else :
        
            switches[num] =  0 if switches[num] == 1 else 1 # 반전
            left = num-1
            right = num+1
            while(left>=1 and right < n+1):
                if(switches[left]==switches[right]):
                    switches[left] = 0 if switches[left] == 1 else 1 # 반전
                    switches[right] = 0 if switches[right] == 1 else 1 # 반전
                    left-=1
                    right+=1
                else:
                    break
        

for i in range(1,n,20):
    print(*switches[i:i+20])
