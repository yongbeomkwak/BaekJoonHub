from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline



n = int(input())
cards = list(map(int,input().split()))
m = int(input())
questions = list(map(int,input().split()))

count = Counter(cards)

ans = []

for q in questions:
    ans.append(count[q])

print(*ans)