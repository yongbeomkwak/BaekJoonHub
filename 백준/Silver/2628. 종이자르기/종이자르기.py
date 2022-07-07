from sys import *
from collections import *
from queue import *


        


if __name__ == "__main__":
    
    h,v = map(int,input().split())
    n = int(input())
    
    hori = [0,h]
    vert = [0,v]

    for _ in range(n):
        judg,pos = map(int,input().split())
        if(judg==0):
            vert.append(pos)
        else:
            hori.append(pos)
    
    hori.sort()
    vert.sort()
    
    len_vert = []
    len_hori = []
    for i in range(len(hori)-1):
        len_hori.append(hori[i+1]-hori[i])
    
    for i in range(len(vert)-1):
        len_vert.append(vert[i+1]-vert[i])
    
    
    print(max(len_vert)*max(len_hori))
            
            
    
   
    
    
    
    
    

    
   
    
    