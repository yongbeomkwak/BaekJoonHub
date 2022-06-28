from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    n:int =int(stdin.readline()[:-1])
    li=[""]*n
    
    for i in range(n):
        tmp=stdin.readline()[:-1]
        li[i]=tmp
    
 
    s=list(set(li))
    s.sort(key=lambda ss:(len(ss),ss))

    
    for ss in s:
        stdout.write(f'{ss}\n')

    
    
    
 
   
    
   
