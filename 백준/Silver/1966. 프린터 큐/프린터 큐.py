from sys import *
from collections import *
from functools import *

tc = int(stdin.readline()[:-1])

def check(list) -> bool :

  if not(list):
    return True
  
  if reduce(lambda acc, curr: acc + curr ,list,0) == 0 :
    return True

  return False


while tc != 0 :
  tc -= 1
  n, m = map(int,stdin.readline()[:-1].split())
  tmp = list(map(int,stdin.readline()[:-1].split()))

  memo = [0 for _ in range(10)]
  turn = 0
  
  q = deque()
  for i in range(len(tmp)):
    memo[tmp[i]] += 1
    if i != m :
      q.append((tmp[i],False))
    else :
      q.append((tmp[i],True))

  while q:
    now = q.popleft()
    
    if check(memo[now[0]+1:]) :
      memo[now[0]] -= 1
      turn += 1
      if now[1] == True:
        break
    else:
      q.append(now)
      

  stdout.write(f"{turn}\n")
    
  
