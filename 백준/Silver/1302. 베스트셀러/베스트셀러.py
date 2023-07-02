from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *


  

n = int(stdin.readline()[:-1])


chart = defaultdict(int)

for _ in range(n):
    name = stdin.readline()[:-1]
    chart[name] += 1


maxV = max(chart.values())


schart = dict(sorted(chart.items()))

for b in schart:
    if(chart[b] == maxV):
        print(b)
        break
