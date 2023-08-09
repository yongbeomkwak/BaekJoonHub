from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline

DIV =  1000000000

dp = [ [ 1 if j == 0 else 0 for j in  range(201)] for i in range(201)] #dp[k][n] = k개를 써서 n을 만든 개수 
 # j == 0  즉 만들어되는 숫자가 0이면 , 갯수 상관없이 무조건 1

n,k = map(int,input().split())

for i in range(1,k+1): # 사용 숫자 개수 
    for j in range(1,n+1): # 만들어야되는 숫자 목표 
        for p in range(j+1): # 사용할 수 있는 숫자 범위 
            dp[i][j] += dp[i-1][j-p]  # i개를 써서 j를 만들방법 = (i-1개를 써서 j-p를 만드는 방법) 과 같음 왜 ? p를 더하면 되건든  
            dp[i][j] %= DIV
            

print(dp[k][n])
