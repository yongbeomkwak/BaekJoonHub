from sys import *
from collections import *
from queue import *


def verify_trangle(a:int,b:int,c:int) ->bool:
    
    if(a+b>c):
        return True
    else:
        return False



if __name__ == "__main__":
    n=int(stdin.readline()[:-1])
    
    cnt=0
    
    for i in range(1,n//2+1):
       for j in range(i,n//2+1):
           k = n-(i+j)
           if(k<j):
               break
           if(verify_trangle(i,j,k)==True):
               cnt+=1
               

                      
    

    stdout.write(f'{cnt}')
    
    

    
    
    
            
            
        
        
            
            
            
            
    
   
    
    
    
    
    

    
   
    
    