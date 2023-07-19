from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline

def divide(y,x,size):
    
    global board
    global ans
    
    flag = True;
    
    for i in range(size):
        
        if not flag:
            break
        
        for j in range(size):
            if board[y][x] != board[y+i][x+j]:
                flag = False
                break
    
    
    if flag: #  모두 같은 경우
        ans[board[y][x]] += 1
    
    else:
        next_size = size //2
        divide(y,x,next_size)  # 왼쪽 위
        divide(y,x+next_size,next_size) # 오른쪽 위 
        divide(y+next_size,x,next_size) # 왼쪽 아래
        divide(y+next_size,x+next_size,next_size) # 오른쪽 아래 
        


n = int(input())

board = [[] for _ in range(n)]

for i in range(n):
    board[i] = list(map(int,input().split()))

ans = [0,0]

divide(0,0,n)

print(ans[0])
print(ans[1])
    