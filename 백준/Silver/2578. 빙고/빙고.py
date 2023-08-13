from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

def check():
    global board
    
    count = 0
    
    for i in range(5):
        if board[i][0] == board[i][1] == board[i][2] == board[i][3] == board[i][4] == -1 : #가로 
            count += 1
        
        if board[0][i] == board[1][i] == board[2][i] == board[3][i] == board[4][i] == -1: # 세로
            count += 1
    
    
    
    if board[0][0] == board[1][1] == board[2][2] == board[3][3] == board[4][4] == -1: # 왼위 -> 오아래 대각
        count += 1
    
    if board[0][4] == board[1][3] == board[2][2] == board[3][1] == board[4][0] == -1: # 오위 -> 왼 아래 대각
        count += 1
    
    
   
    
    
        

    return count >= 3 


board = []
pos = [[0,0] for _ in range(26)]

for i in range(5):
    tmp = list(map(int,input().split()))
    board.append(tmp)
    for j in range(5):
        num = tmp[j]
        pos[num][0] , pos[num][1] = i , j 
    


find = False
ans = 0 
for i in range(5):
    
    numbers = list(map(int,input().split()))
    for j in range(5):
        count = (i) * 5  + (j+1) #  부른 횟수 

        x ,y = pos[numbers[j]] 
        board[x][y] = -1
        
        if not find:
            if check():
                ans = count
                find = True
                break


print(ans)
        
    
        

    
    
    