from sys import *
from collections import *


(n,k) = map(int,stdin.readline()[:-1].split())


q = deque([i for i in range(1,n+1)])


result = []
cnt = 1

while q:
  now = q.popleft()
  if cnt == k:
    result.append(now)
    cnt = 1
  else:
    q.append(now)
    cnt += 1

result = map(str,result)

stdout.write(f'<{", ".join(result)}>')
  