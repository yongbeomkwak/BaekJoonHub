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


trains = [ "0" * 20  for _ in range(n)]


for _ in range(m):
    command = list(map(int,input().split()))
    
    oper = 0
    index = 0  
    x = 0 
    
    if len(command) == 3 : # 1,2 는 매개변수 3 개 
        oper,index,x = command
    
    else: # 3,4는 매개변수 2개 
        oper,index = command
    
    
    index -= 1 # 인덱스로 사용하기 위해 -1 
    curr = list(trains[index]) # 현재 기차 좌석 상태를 리스트 
    x = 20 - x  # 기차 좌석 방향에 맞게 변환 
    
    # 기차 좌석 방향 
    # 뒤                      앞 
    # 19 18 .... 5 4 3 2 1    0
    
    if oper == 1: # 탑승

        curr[x] = "1" # 해당 위치 탑습 
        trains[index] = "".join(curr) # 다시 문자열로 

    
    elif oper == 2: # 하차
        
        curr[x] = "0" # 해당 위치 하차 
        trains[index] = "".join(curr)
        
    
    elif oper == 3: # 뒤로 밀기 
           
        curr = curr[1:] + ["0"] #  k -> k +1  , 0 번  하차 , 1 ~19 + [빈자리] = 20자리
        
        trains[index] = "".join(curr)
    
    else: # 앞으로 밀기 
        
        curr = ["0"] + curr[:19] # k -> k-1 , 19번 하차 , [빈자리] + 0 ~18 = 20 자리 
        
        trains[index] = "".join(curr)
    
    

print(len(set(trains))) # 중복된 패턴 제거 
    
