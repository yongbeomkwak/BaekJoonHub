from heapq import *
def solution(operations):
    answer = []
    
    h1 = [] #최소힙
    h2 = [] #최대힙
    l = 0
    
    for s in operations:
        oper,n = s.split()
        n = int(n)
        if oper  == "I":
            heappush(h1,(n,n))
            heappush(h2,(-n,n))
            l +=1
        
        else :
            l -= 1
            if(l > 0):
                if n == 1:
                    heappop(h2)
                else:
                    heappop(h1)
               
            elif(l == 0):
                while h1:
                    heappop(h1)
                while h2:
                    heappop(h2)
        
    
    
    return  [0,0] if l<=0 else [heappop(h2)[1],heappop(h1)[1]]