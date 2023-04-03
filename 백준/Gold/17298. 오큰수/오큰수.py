from sys import *
from collections import *
import heapq

n = int(stdin.readline()[:-1])


input  = list(map(int,stdin.readline()[:-1].split()))

ans = [-1 for _ in range(n)]

stack = [0] # 처리가 필요한 인덱스들

for i in range(1, n):
    while stack and input[stack[-1]] < input[i]:
        ans[stack.pop()] = input[i]
    stack.append(i)


print(*ans)
 