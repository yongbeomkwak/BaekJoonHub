from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


k = int(input())
n = 2**k -1

arr = list(map(int,input().split()))

tree = [[] for _ in range(k)]

k -= 1

def inOrder(child,h):
    global k 
    global tree
    
    
    root = len(child) // 2
    
    if h > k: # 높이를 벗어남
        return
    
    inOrder(child[:root],h+1)
    tree[h].append(child[root])
    inOrder(child[root+1:],h+1)


inOrder(arr,0)

for i in range(len(tree)):
    print(*tree[i])
    
