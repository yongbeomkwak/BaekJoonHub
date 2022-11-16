from collections import *  
def solution(participant, completion):
    answer = ''
    c = Counter(participant)
    
    for com in completion:
        if(c[com] > 0):
            c[com] -= 1
        
    
    
    return   list(c.elements())[0]