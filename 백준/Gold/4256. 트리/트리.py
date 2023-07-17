from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


def postorder(preorder, inorder,ans):
    if not inorder:
        return
    root = preorder.pop(0) #  전위 순회의 가장 앞은 항상 root 노드 
    idx = inorder.index(root) # 중위 순회는 root를 기준으로 왼,오가 나뉜다
    postorder(preorder, inorder[:idx],ans) # left subtree
    postorder(preorder, inorder[idx + 1:],ans) # right subtree
    ans.append(root)
    

    

tc = int(input())

for _ in range(tc):
    n = int(input())
    preorder = list(map(int,input().split()))
    inorder = list(map(int,input().split()))

    ans = []
    postorder(preorder,inorder,ans)
    print(*ans)
    
    
    


    




    
