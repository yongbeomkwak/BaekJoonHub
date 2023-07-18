from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


def preOrder(inStart,inEnd,postStart,postEnd):
    
    global ans
    global in_order
    global post_order
    global node_pos
    
    if inStart > inEnd or postStart > postEnd:
        return

    root = post_order[postEnd] # 후위순회의 마지막은 항상 루트 노드
    pos = node_pos[root] # 중위순회 루트 인덱스
    
    
    #중위 순회 : 7 3 8 1 9 4 10  //(left) [0] 11 5 2 6
    #후위 순회 : 7 8 3 9 10 4 1 //(left) 11 5 6 2  [0]
    
    
    leftNode =  pos - inStart -1 # 왼쪽 서브트리 개수
    rightNode = inEnd - pos # 오른쪽 서브트리 개수
    
    # 이때 중위 순회에서 왼쪽 서브 트리의 범위는
    # 시작 인덱스 ~ (시작 인덱스 + 왼쪽 서브 트리의 노드 수)

    # 중위 순회에서 오른쪽 서브 트리의 범위는
    # (끝 인덱스 - 오른쪽 서브 트리의 수 + 1) ~ 끝 인덱스

    # 후위 순회에서 왼쪽 서브 트리의 범위는
    # 시작 인덱스 ~ (시작 인덱스 + 왼쪽 서브 트리의 노드 수)

    # 후위 순회에서 오른쪽 서브 트리의 범위는
    # (끝 인덱스 - 오른쪽 서브 트리의 수) ~ (끝 인덱스 - 1)
    
    ans.append(root) #전위 순회
    preOrder(inStart, inStart + leftNode, postStart, postStart + leftNode)
    preOrder(inEnd - rightNode + 1, inEnd, postEnd - rightNode, postEnd - 1)
    

n = int(input())

in_order = list(map(int,input().split()))
post_order = list(map(int,input().split()))
ans = []

node_pos = [-1 for _ in range(n+1)]

for i in range(len(in_order)):
    node_pos[in_order[i]] = i # 해당 노드에 대한 인덱스



preOrder(0,n-1,0,n-1)

print(*ans)


    




    
