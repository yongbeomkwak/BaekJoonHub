from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    n:int =int(stdin.readline()[:-1])
    
    li=[]
    
    for i in range(n):
        num:int =int(stdin.readline()[:-1])
        li.append(num)
        
    
    li.sort()
    
    for i in range(n):
        stdout.write(str(li[i])+'\n')
   
    
   
