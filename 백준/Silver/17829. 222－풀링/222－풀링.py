from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline

n = int(input())

def pulling(y,x,size):
    
    global board
    
    if size == 2 :
        arr = []
        for i in range(2):
            for j in range(2):
                arr.append(board[y+i][x+j])
        
        return sorted(arr)[2] ## 두번째로 큰 수
    
    
    arr = []
    
    next_size = size // 2
    lu = pulling(y,x,next_size) # 왼쪽 위
    ru = pulling(y,x+next_size,next_size) # 오른쪽 위 
    lb = pulling(y+next_size,x,next_size) # 왼쪽 아래
    rb =pulling(y+next_size,x+next_size,next_size) # 오른쪽 아래
    
    arr.append(lu)
    arr.append(ru)
    arr.append(lb)
    arr.append(rb)
    
    return sorted(arr)[2] ## 두번째로 큰 수
    
board = [[] for _ in range(n)]


for i in range(n):
    board[i] = list(map(int,input().split()))


print(pulling(0,0,n))
    