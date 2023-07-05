from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


input = stdin.readline


n,m = map(int,input().split())

def bfs(start):
	cnt = 1
	queue = deque([start])
	visit = [False for _ in range(n+1)]
	visit[start] = True

	while queue:
		cur = queue.popleft()

		for nx in graph[cur]:
			if not visit[nx]:
				visit[nx] = True
				cnt += 1
				queue.append(nx)

	return cnt

graph = [[] for _ in range(n+1)]

for _ in range(m):
	a,b = map(int,input().split())
	graph[b].append(a)

maxCnt = 1
ans = []

for i in range(1,n+1):
	cnt = bfs(i)
	if cnt > maxCnt:
		maxCnt = cnt
		ans.clear()
		ans.append(i)
	elif cnt == maxCnt:
		ans.append(i)

print(*ans)