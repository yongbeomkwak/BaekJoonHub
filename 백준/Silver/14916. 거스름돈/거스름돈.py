from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *

setrecursionlimit(10**9)
input = stdin.readline


n = int(input())


if n < 5:
    
    if n % 2 == 0:
        print(n//2)
    
    else:
        print(-1)

else:
    
    ans,n = divmod(n,5)

        
    if n != 0:
        
        if n % 2 == 0:
            ans += n // 2 
        
        else:
            ans -= 1 # 복구 , 2 동전으로 계산하기 위해 
            ans += (n+5) // 2  # (n+5) , 다시 복구 , 이후 2 동전으로 나눔
            
    print(ans)
            
        