from collections import *
def solution(want, number, discount):
    answer = 0
    l = len(discount)
    zipped = []
    for w,n in zip(want,number): 
        zipped += ([w] * n)
    
    check = Counter(zipped)


    for begin in range(l-9):
        items = discount[begin:begin+10]
        citems = Counter(items)
        
        if(citems == check):
            answer += 1
            
    
    return answer