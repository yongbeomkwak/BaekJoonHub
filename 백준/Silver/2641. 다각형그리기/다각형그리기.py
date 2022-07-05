from sys import *
from collections import *
from queue import *


        


if __name__ == "__main__":
    
    n=int(input())
    standard = list(map(int,input().split()))
    standard = deque(standard)
    reversed_s = deque()
    
    for s in standard:
        r=0
        if s==1:
           r = 3
        elif s==2:
            r = 4
        elif s ==3:
            r = 1
        elif s==4:
            r = 2
        reversed_s.appendleft(r)
    
    candidate = []
    
    while n:
        standard.rotate(1)
        reversed_s.rotate(1)
        n-=1
        candidate.append(list(standard))
        candidate.append(list(reversed_s))

    answer=[]
    
    
    
    m=int(input())
    
    for _ in range(m):
        s = list(map(int,input().split()))
        if s in candidate:
            answer.append(s)
    
    print(len(answer))
    
    for ans in answer:
        print(*ans)

        
        
        
   
    
    
    
    
    

    
   
    
    