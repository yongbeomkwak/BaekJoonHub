from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline

n = int(input())

tree = defaultdict(tuple)

for _ in range(n):
    
    parent,left,right = input().split()
    
    tree[parent] = (left,right)
    

resultPre = []
resultIn = []
resultPost = []

def preOrder(root:str):
    
    global resultPre
    
    if root == ".":
        return 

    child = tree[root]
    left = child[0]
    right = child[1]
    
    resultPre.append(root)
    preOrder(left)
    preOrder(right)

def inOrder(root:str):
    
    global resultIn
    
    if root == ".":
        return 

    child = tree[root]
    left = child[0]
    right = child[1]
    
    inOrder(left)
    resultIn.append(root)
    inOrder(right)

def postOrder(root:str):
    
    global resultPost
    
    if root == ".":
        return 

    child = tree[root]
    left = child[0]
    right = child[1]
    
    postOrder(left)
    postOrder(right)
    resultPost.append(root)

preOrder("A")
inOrder("A")
postOrder("A")

print("".join(resultPre))
print("".join(resultIn))
print("".join(resultPost))
        
    



