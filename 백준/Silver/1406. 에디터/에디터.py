from sys import *
from collections import *
import heapq



prefix = list(stdin.readline()[:-1])

suffix = []

n = int(stdin.readline()[:-1])

for _ in range(n):
  oper = stdin.readline()[:-1].split()
    
   
    
  if oper[0] == "L" and prefix :
      suffix.append(prefix.pop())

  elif oper[0] == "D" and suffix :
      prefix.append(suffix[-1])
      suffix.pop()

  elif oper[0] == "B" and prefix:
    prefix.pop()

  elif oper[0] == "P":
    c = oper[1]
    prefix.append(c)



while suffix:
  prefix.append(suffix.pop())


stdout.write(f'{"".join(prefix)}')



    
        
        
        
      
      