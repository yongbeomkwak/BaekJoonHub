from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())

board = [ [" " for _ in range(n)] for _ in range(n) ]


def printStart(y,x,n):
    global board
    
    if(n==3):
        for i in range(3):
            for j in range(3):
                if(i==1 and j==1):
                    board[y+i][x+j]= " "
                    continue
                board[y+i][x+j]= "*"
        return
    
    m=n//3
    for i in range(3):
        for j in range(3):
            if(i==1 and j==1):
                continue 
            printStart(y+i*m,x+j*m,m)

printStart(0,0,n)

for i in range(n):
    print("".join(board[i]))
