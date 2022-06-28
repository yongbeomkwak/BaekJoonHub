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
                print(heapq.heappop(heap)[1])
        else:
            heapq.heappush(heap,(-num,num)) #(우선순위,실제 값) -를 붙여 num이 클수록 top에 위치
        
    

   
    
   
