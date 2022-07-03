from sys import *
from collections import *
from queue import *

if __name__ == "__main__":
   
    index=[]
    dx=[0,0,1,-1]
    dy=[1,-1,0,0]
    
    n:int =int(stdin.readline()[:-1])
    gmap = [list(map(int, stdin.readline()[:-1])) for _ in range(n)] 
    

        
    

    
    for i in range(n):
        for j in range(n):
            
            if(gmap[i][j]==0):
                continue
            
      
            gmap[i][j]=0
            q=Queue()
            q.put((i,j))
            cnt:int =1 
            
            while(q.qsize()!=0):
                y,x=q.get()
                
                for k in range(4):
                    ny=y+dy[k]
                    nx=x+dx[k]
                    
                    
                    if(ny<0 or nx<0 or ny>=n or nx>=n):
                        continue
                    
                    if(gmap[ny][nx]==0):
                        continue
                    
                    q.put((ny,nx))
                    gmap[ny][nx]=0
                    cnt+=1
                    
            index.append(cnt)
                    
    
    
    stdout.write(f'{len(index)}\n')
    index.sort()
    
    for i in range(len(index)):
        stdout.write(f'{index[i]}\n')

    
    
