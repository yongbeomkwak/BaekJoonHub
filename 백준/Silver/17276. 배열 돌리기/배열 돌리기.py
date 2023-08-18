from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline


# 시계 방향 
# 주 대각선 -> 가운데 열  (1,1) ,(2,2) .. (n,n) -> (1,(n+1)/2) (2,(n+1)/2) 
# 가운데 열 -> 부 대각선  (1,(n+1)/2) .. (2,(n+1)/2) -> (1,n) , (n-1,2) .. 
# 부 대가선 -> 가운데 행  (1,n) , (n-1,2) ..  -> ((n+1)/2,1) .. ((n+1)/2,2)
# 가운데 행 -> 주 대각선 ,  ((n+1)/2,1) .. ((n+1)/2,2) .. -> (1,1) , (2,2)


# 반시계 방향 
# 주 대각선 -> 가운데 행  (1,1) ,(2,2) .. (n,n) -> ((n+1)/2,1) .. ((n+1)/2,2)
# 가운데 행 -> 부 대각선  ((n+1)/2,1) .. ((n+1)/2,2)  -> (1,n) , (n-1,2) ..
# 부대각 선 -> 가운데 열  (1,n) , (n-1,2) -> (1,(n+1)/2) ..  
# 가운데 열 -> 주 대각 선 (n-1,2) .. (1,(n+1)/2) ..  -> (1,1) , (2,2)



def clockWise(n, X):
    tmp = [[0 for i in range(n)] for j in range(n)]

    for i in range(n):
        for j in range(n):
            tmp[i][j] = X[i][j]

    for i in range(n):
        # X의 주 대각선을 ((1,1), (2,2), …, (n, n)) 가운데 열 ((n+1)/2 번째 열)로 옮긴다.
        tmp[i][n//2] = X[i][i]
        # X의 가운데 열을 X의 부 대각선으로 ((n, 1), (n-1, 2), …, (1, n)) 옮긴다.
        tmp[i][(n - 1) - i] = X[i][n // 2]
        # X의 부 대각선을 X의 가운데 행 ((n+1)/2번째 행)으로 옮긴다.
        tmp[n // 2][i] = X[(n - 1) - i][i]
        # X의 가운데 행을 X의 주 대각선으로 옮긴다.
        tmp[i][i] = X[n // 2][i]

    return tmp


def antiClockWise(n, X):
    tmp = [[0 for i in range(n)] for j in range(n)]

    for i in range(n):
        for j in range(n):
            tmp[i][j] = X[i][j]

    for i in range(n):
        # X의 주 대각선을 ((1,1), (2,2), …, (n, n)) 가운데  행 ((n+1)/2 번째 행)로 옮긴다.
        tmp[n//2][i] = X[i][i]
        # X의 가운데 열을 X의 주 대각선으로 ((1, 1), (2, 2), …, (n, n)) 옮긴다.
        tmp[i][i] = X[i][n // 2]
        # X의 부 대각선을 X의 가운데 열 ((n+1)/2번째 열)으로 옮긴다.
        tmp[i][n//2] = X[i][(n - 1) - i]
        # X의 가운데 행을 X의 부 대각선으로 옮긴다.
        tmp[(n-1)-i][i] = X[n // 2][i]

    return tmp
    
   
    
    

tc = int(input())

for _ in range(tc):
    n , degree = map(int,input().split())
    matrix = []
    
    for i in range(1,n+1):
        row = list(map(int,input().split()))
        matrix.append(row)
    
    degree //= 45
    
    if degree < 0:
        degree *= -1
        for k in range(degree):
            matrix = antiClockWise(n, matrix)
        
    else:
        for k in range(degree):
            matrix = clockWise(n, matrix)
 

    for i in range(n):
        print(*matrix[i])
    



