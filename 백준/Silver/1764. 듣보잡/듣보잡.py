from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    setrecursionlimit(2500)
    
    n,m =stdin.readline()[:-1].split()
    n=int(n)
    m=int(m)
    dic=dict()
    for i in range(n):
        name=stdin.readline()[:-1]
        dic[name]=1
    
    ret=[]
    for i in range(m):
        name=stdin.readline()[:-1]
        if(dic.get(name)!=None):
            ret.append(name)
    
    
    ret.sort()
    
    stdout.write(f'{len(ret)}\n')
    for name in ret:
        stdout.write(f'{name}\n')
            
    
                

    
    
    
 
   
    
   
