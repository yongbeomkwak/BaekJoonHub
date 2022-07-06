from sys import *
from collections import *
from queue import *


        


if __name__ == "__main__":
    
    n:int = int(stdin.readline()[:-1])
    switches = [-1] + list(map(int,stdin.readline()[:-1].split()))
    
    n_students = int(stdin.readline()[:-1])
    
    for i in range(n_students):
        
        gender, idx = map(int, input().split())
        if(gender==1):
            for j in range(idx,n+1,idx):
                switches[j]=int(not(switches[j]))
                
        else:
            switches[idx]=int(not(switches[idx]))
            left =idx-1
            right = idx+1
            while(left>=1 and right < n+1):
                if(switches[left]==switches[right]):
                    switches[left] = int(not(switches[left]))
                    switches[right] = int(not(switches[right]))
                    left-=1
                    right+=1
                else:
                    break
 
    
    for i in range(1,n+1):
        print(switches[i], end = " ")
        
        if i % 20 == 0 :
            print()
      
            
    
   
    
    
    
    
    

    
   
    
    