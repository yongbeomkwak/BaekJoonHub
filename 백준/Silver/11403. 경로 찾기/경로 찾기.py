from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


n = int(input())

adj = []
prev = []

for _ in range(n):
    adj.append(list(map(int,input().split())))


for k in range(n):
    for i in range(n):
        for j in range(n):
            if adj[i][k] == 1 and adj[k][j] == 1:
                adj[i][j] = 1 


for i in range(n):
    print(*adj[i])




