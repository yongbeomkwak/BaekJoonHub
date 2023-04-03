from sys import *
from collections import *
import heapq

n = int(stdin.readline()[:-1])


input  = list(map(int,stdin.readline()[:-1].split()))

ans = [-1 for _ in range(n)]

stack = [0] # 처리가 필요한 인덱스들

for i in range(1, n):
    while stack and input[stack[-1]] < input[i]:  # 최근 삽입 인덱스의 오큰수가 발견될 때 마다 , 담겨있는 index에 대한 검사 순회
        ans[stack.pop()] = input[i]
    stack.append(i)


print(*ans) # 리스트를 간단한 공백과 함께 출력 , * = 압축해제 연산
 