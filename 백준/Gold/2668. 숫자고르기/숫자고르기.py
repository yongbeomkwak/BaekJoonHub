from sys import *
from collections import *
from queue import *

result=[]


def dfs(u,visit):
    visit.add(u)
    checked[u]=True
    
    for v in graph[u]:
        if v not in visit:
            dfs(v,visit.copy())
        else:
            result.extend(list(visit))
            return
        


if __name__ == "__main__":
   
    n:int = int(stdin.readline()[:-1])
    checked = [False for _ in range(n+1)]
    graph=[list() for _ in range(n+1)] 
    
  
    for i in range(1,n+1):
        tmp=int(stdin.readline()[:-1])
        graph[tmp].append(i)
  
    
    for i in range(1,n+1):
        if(not(checked[i])):
            dfs(i,set([]))
    
            
           
    result.sort()
    
    print(len(result))
    
    for i in result:
        print(i)
    
    
    

    
   
    
    