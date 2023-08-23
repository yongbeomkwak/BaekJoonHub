from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)

# 개수가 같으면 상대가 먹음 
# 가장 큰 점수 차
# 방법이 여러개면 , 가장 낮은 점수를 더 많이 맞춘
# 없거나 비기면 [-1]
# 나는 라이언
def solution(n, info):
    
    info = info[::-1] # 0 ~ 10
    k = len(info)
    max_gap = -1
    answer = []
    
    for comb in combinations_with_replacement(range(k),n): # nHr , 라이언이 쏜 화살 조합
        
        c = Counter(comb) # 카운터 딕셔너리
        ry = 0 #라이언
        ap = 0 #어피
        
        tmp = [0 for _ in range(k)]
        
        for i in range(k):
            if info[i] < c[i]: # 라이언이 점수 딸려면 무조건 많이 쏴야함 비겨도 안됨
                ry += i
                
            elif info[i] != 0 : # 어피치가 하나라도 맞췄다면
                ap += i 
            
            tmp[i] = c[i]
        
        diff = ry - ap 
        
        if diff > 0: #라이언이 이긴다면
            if diff > max_gap: # 차이가 max_gap 과 같다면 , 더 낮은 점수를 맞힌 패턴이 정답이므로 = 는 빠짐
                
                answer = tmp
                max_gap = diff
        
    
    return answer[::-1] if answer else [-1]