from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

#setrecursionlimit(10**9)
input = stdin.readline

def texi_dist(p1,p2):
    
    return abs(p1[0]-p2[0]) + abs(p1[1]-p2[1])

sl ,sr = input()[:-1].split()

words = input()[:-1]

vowel = "yuiophjklbnm" # 한글 모음 글자들 오른쪽 손가락으로 누를 것 들 

keyboard = defaultdict(list)

keyboard["q"] = (0,0)
keyboard["w"] = (0,1)
keyboard["e"] = (0,2)
keyboard["r"] = (0,3)
keyboard["t"] = (0,4)
keyboard["y"] = (0,5)
keyboard["u"] = (0,6)
keyboard["i"] = (0,7)
keyboard["o"] = (0,8)
keyboard["p"] = (0,9)

keyboard["a"] = (1,0)
keyboard["s"] = (1,1)
keyboard["d"] = (1,2)
keyboard["f"] = (1,3)
keyboard["g"] = (1,4)
keyboard["h"] = (1,5)
keyboard["j"] = (1,6)
keyboard["k"] = (1,7)
keyboard["l"] = (1,8)

keyboard["z"] = (2,0)
keyboard["x"] = (2,1)
keyboard["c"] = (2,2)
keyboard["v"] = (2,3)
keyboard["b"] = (2,4)
keyboard["n"] = (2,5)
keyboard["m"] = (2,6)


ans = 0

for w in words:
    
    if w in vowel:
         ans += texi_dist(keyboard[sr],keyboard[w])
         sr = w
    
    else:
        ans += texi_dist(keyboard[sl],keyboard[w])
        sl = w 
    
    ans += 1  # 누르는 시간 
    
print(ans)







