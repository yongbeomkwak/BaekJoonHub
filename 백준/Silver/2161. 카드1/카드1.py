from sys import *
from collections import deque


n = int(stdin.readline()[:-1])


q = deque([i for i in range(1,n+1)])

remove = True

result = []

while q :

  curr = q.popleft()

  if remove :
    result += [str(curr)]
  else :
    q.append(curr)

  remove = not(remove)


stdout.write(" ".join(result))
