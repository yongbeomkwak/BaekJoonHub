from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    n:int =int(stdin.readline()[:-1])
    
    li=[]
    
    for i in range(n):
        _in:str=(stdin.readline()[:-1]).split()
        li.append((int(_in[0]),_in[1]))
        
    li.sort(key= lambda x:x[0])
    
    for i in range(n):
        stdout.write(f'{li[i][0]} {li[i][1]}\n')
    
 
   
    
   
