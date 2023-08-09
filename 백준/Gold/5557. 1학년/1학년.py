from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


n = int(input())
arr = [0] +  list(map(int,input().split()))

dp = [[0 for _ in range(21)] for _ in range(n+1) ] #dp[i][j] = i번째까지 연산으로 j를 만들 수 있는 가능성


# 음수 및 20 초과 안됨 

dp[1][arr[1]] = 1 # 1번째 값은 뻬면 음수이므로 , 덧셈만 가능 
for i in range(2,n+1): # 연산한 구간 
    for j in range(21): # 20까지

        if dp[i-1][j] == 0 : # 이전 연산 개수가 0이면 불가능
            continue
        
        nxt1 = j + arr[i] # 다음 합 연산 결과
        nxt2 = j - arr[i] # 다음 차 연산 결과
        
        if nxt1 <= 20: # 20보다 작고
            dp[i][nxt1] += dp[i-1][j]
        
        if nxt2 >= 0: # 음수가 아닐 때
            dp[i][nxt2] += dp[i-1][j]


print(dp[n-1][arr[n]]) # 마지막 수를 제외한 모든 연산을 끝 맞췄을 때 마지막 숫자가 와 같은 총 개수 출력
