from sys import *
from collections import *
from functools import *

# 중위 순회


k = int(stdin.readline()[:-1])

city =  list(map(int,stdin.readline()[:-1].split()))


tree = [[] for i in range(k)]


def dfs(side:list,current_height:int):



    l = len(side)
    rt =  l // 2
    
    tree[current_height].append(side[rt])
    
    if l == 1:
        return
    
    dfs(side[:rt],current_height+1)
    dfs(side[rt+1:],current_height+1)
    
    
 
    

dfs(city,0)


for i in range(k):
    print(*tree[i])

