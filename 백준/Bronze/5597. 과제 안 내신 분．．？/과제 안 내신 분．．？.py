from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

#setrecursionlimit(10**9)
input = stdin.readline


sub_student = []

for _  in range(28):
    n = int(input())
    sub_student.append(n)


for i in range(1,31):
    if not i in sub_student:
        print(i)






