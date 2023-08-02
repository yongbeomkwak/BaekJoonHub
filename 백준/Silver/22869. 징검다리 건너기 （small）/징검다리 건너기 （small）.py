from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline



def consume(i,j):
    
    global arr
    
    return (j-i) * (1 + abs(arr[i] - arr[j]))


n, limit = map(int,input().split())

arr =[0] + list(map(int,input().split()))

dp = [False for _ in range(n+1)]

dp[1] = True

for i in range(1,n+1):
    
    if not dp[i]:
        continue
    
    for j in range(i+1,n+1):
        
        if consume(i,j) <= limit:
            dp[j] = True


if dp[n]:
    print("YES")
else:
    print("NO")



