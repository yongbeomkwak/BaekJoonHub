from sys import *
from collections import *
import heapq



input = list(stdin.readline()[:-1])
result = 0
n_rod = []



for i in range(len(input)):

  if input[i] == "(":
    n_rod.append("(")
    continue

  if input[i-1] == "(" and input[i] == ")":
    n_rod.pop()
    result += len(n_rod)

  if input[i-1] == ")" and input[i] == ")":
    n_rod.pop()
    result += 1


print(result)
   
 
      