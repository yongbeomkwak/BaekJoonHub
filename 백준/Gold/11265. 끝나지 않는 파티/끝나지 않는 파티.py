from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline

succ = "Enjoy other party\n"
fail = "Stay here\n"
ans = ""


n,m = map(int,input().split())
adj = []
prev = [[ i for _ in range(m)] for i in range(n)]



for _ in range(n):
    adj.append(list(map(int,input().split())))



for k in range(n):
    for i in range(n):
        for j in range(n):
            if adj[i][k] + adj[k][j] < adj[i][j]:
                prev[i][j] = prev[k][j]
                adj[i][j] = adj[i][k] + adj[k][j]

for _ in range(m):

    a,b,c = map(int,input().split())
    a -= 1
    b -= 1
    
    if adj[a][b] <= c:
        ans += succ
    else :
        ans += fail


print(ans[:-1])