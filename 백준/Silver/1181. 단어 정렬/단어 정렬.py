from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    n:int =int(stdin.readline()[:-1])
    li=[""]*n
    
    for i in range(n):
        tmp=stdin.readline()[:-1]
        li[i]=tmp
    
 
    s=list(set(li)) # 중복제거 
    s.sort(key=lambda ss:(len(ss),ss)) # 글자수작은것 , 문자열 오름차순(사전수)

    
    for ss in s:
        stdout.write(f'{ss}\n')

    
    
    
 
   
    
   
