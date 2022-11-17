from collections import *
def solution(clothes):
    answer = 0
    l = []
    
    for name,category in clothes:
        l.append(category)
        
    c = Counter(l)
    print(c)
    total = 1
    for k in c.keys():
        total *= (c[k]+1)
    
    
    
    
    return total-1