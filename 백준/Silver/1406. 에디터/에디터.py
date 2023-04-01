from sys import *
from collections import *
import heapq



prefix = list(stdin.readline()[:-1])

suffix = []

n = int(stdin.readline()[:-1])

for _ in range(n):
  oper = stdin.readline()[:-1].split()

  if oper[0] == "L" and prefix : 
      # prefix 존재하고 L일 경우
      # suffix 쪽으로 옮김
      suffix.append(prefix.pop())

  elif oper[0] == "D" and suffix :
      # suffix 의 가장 뒤를 prefix 끝으로 옮김
      prefix.append(suffix.pop())
      

  elif oper[0] == "B" and prefix:
    # prefix 있을경우 제거 
    prefix.pop()

  elif oper[0] == "P":
    #prefix 뒤에 붙힘
    c = oper[1]
    prefix.append(c)


# suffix를 거꾸로 추가
while suffix:
  prefix.append(suffix.pop())


stdout.write(f'{"".join(prefix)}')



    
        
        
        
      
      
