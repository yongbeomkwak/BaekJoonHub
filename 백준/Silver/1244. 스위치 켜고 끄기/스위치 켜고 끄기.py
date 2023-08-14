from sys import *
from collections import *
from queue import *


        


if __name__ == "__main__":
    
    n:int = int(stdin.readline()[:-1])
    switches = list(map(int,stdin.readline()[:-1].split()))
    
    n_students = int(stdin.readline()[:-1])
    
    tasks = []
    for _ in range(n_students):
        _in = list(map(int,stdin.readline()[:-1].split()))
        tasks.append((_in[0],_in[1]))
    
    for i in range(n_students):
        now = tasks[i]
        gender = now[0]
        idx = now[1]
        
        if(gender==1):

            for j in range(idx-1,len(switches),idx):
                switches[j]=int(not(switches[j]))
                
        else:
            switches[idx-1]=int(not(switches[idx-1]))
            
            left =idx-2
            right = idx
            while(left>=0 and right < len(switches)):
                if(switches[left]==switches[right]):
                    switches[left] = int(not(switches[left]))
                    switches[right] = int(not(switches[right]))
                    left-=1
                    right+=1
                    continue
                else:
                    break
 
    
    for i in range(len(switches)):
        if((i+1)%20 ==0):
            stdout.write(f'{switches[i]} \n')
        else:
            stdout.write(f'{switches[i]} ')
            
    
   
    
    
    
    
    

    
   
    
    