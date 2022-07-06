from sys import *
from collections import *
from queue import *


        


if __name__ == "__main__":
    
    # a1 a2 
    # a3 = a1 - a2 
    # a4 = a2 - a3
    # a5 = a3 - a4
    
    start:int = int(stdin.readline()[:-1])
    max_len:int = 0 
    answer = []
    
    second:int = start//2
    
    while(second<=start):
        tmp=[]
        tmp.append(start)
        tmp.append(second)
        prev1 = 0
        prev2 = 1
        curr = tmp[prev1] - tmp[prev2]
        while(curr>=0):
            
            tmp.append(curr)
            prev1 +=1
            prev2 +=1
            curr = tmp[prev1] - tmp[prev2]
            
        if(max_len<len(tmp)):
            max_len=len(tmp)
            answer=tmp
        
        second+=1
    
    print(max_len)
    for ans in answer:
       stdout.write(f'{ans} ')
        
        
    
   
    
    
    
    
    

    
   
    
    