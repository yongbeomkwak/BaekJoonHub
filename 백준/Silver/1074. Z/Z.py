from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


ans = 0

def recursive(curr_r,curr_c,size):
    
    global ans
    global r
    global c
    

    if curr_r  == r and curr_c == c: # 목표 도착
        print(ans)
        exit(0)
    
    if size == 1:
        ans += 1
        return

    if not ( curr_r <= r < curr_r+size and curr_c <= c < curr_c + size ): # 현재 범위에 포함 안되면 다음 재귀 없음
        ans += size*size
        return
    
    
    next_size = size // 2 # 다음 사이즈
    recursive(curr_r,curr_c,next_size) # 죄상
    recursive(curr_r,curr_c+next_size,next_size) # 우상
    recursive(curr_r+next_size,curr_c,next_size) # 좌하
    recursive(curr_r+next_size,curr_c+next_size,next_size) #우하


n,r,c = map(int,input().split())

recursive(0,0,2**n)
