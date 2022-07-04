from sys import *
from collections import *
from queue import *


if __name__ == "__main__":
   
    board=[[0 for _ in range(101)] for _ in range(101)]
    
    ret:int=0
    for _ in range(4):
        x1,y1,x2,y2 =  map(int, input().split())
        
        for y in range(y1,y2):
            for x in range(x1,x2):
                if(board[y][x]==1):
                    continue
                else:
                    board[y][x]=1
                    ret+=1
    
    print(ret)
        
   
    
    
    
    
    

    
   
    
    