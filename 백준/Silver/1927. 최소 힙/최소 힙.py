from sys import stdin
from collections import *
import heapq
if __name__ =='__main__':
    n:int =int(stdin.readline()[:-1])
    
    heap=[]
    
    for i in range(n):
        num:int =int(stdin.readline()[:-1])
        if(num==0):
            if(len(heap)==0):
                print(0)
            else:
                print(heapq.heappop(heap))
        else:
            heapq.heappush(heap,num)
        
    

   
    
   
