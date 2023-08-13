from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

money = int(input())
s = j = money
arr = list(map(int,input().split()))


j_count = 0
s_count = 0 
s_decrease_count = 0 
s_increase_count = 0 

for i in range(len(arr)):
    
    if arr[i] <= j: # BNP 매수법 
        j_count += j // arr[i]
        j = j % arr[i]
    
    if i == 0:
        continue
    
    if arr[i-1] < arr[i]: #현재 값이 크면 
        s_increase_count += 1
        s_decrease_count = 0
    
    elif arr[i-1] > arr[i]: #현재 값이 작으면
        s_decrease_count += 1
        s_increase_count = 0 
    
    else:
        s_decrease_count = 0 
        s_increase_count = 0
    
    
    if s_decrease_count >= 3: # 전량 매수 
        s_count += s // arr[i]
        s %= arr[i]
    
    if s_increase_count >= 3: #전량 매도 
        s += s_count * arr[i]
        s_count = 0 
    

j += j_count * arr[-1]
s = s + arr[-1] * s_count if s_count !=0 else s  #  만약 14일까지 팔지 못한 개수가 남아 있으면 , 전량 매도 한 것을 더함 


if s > j:
    print("TIMING")

elif s < j:
    print("BNP")

else:
    print("SAMESAME")
    
        
    
        
    
    
    
    